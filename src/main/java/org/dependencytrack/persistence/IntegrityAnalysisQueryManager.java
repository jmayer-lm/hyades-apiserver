/*
 * This file is part of Dependency-Track.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * Copyright (c) OWASP Foundation. All Rights Reserved.
 */
package org.dependencytrack.persistence;

import alpine.resources.AlpineRequest;
import org.dependencytrack.model.IntegrityAnalysis;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import java.util.UUID;

public class IntegrityAnalysisQueryManager extends QueryManager implements IQueryManager {

    IntegrityAnalysisQueryManager(final PersistenceManager pm) {
        super(pm);
    }

    IntegrityAnalysisQueryManager(final PersistenceManager pm, final AlpineRequest request) {
        super(pm, request);
    }

    public IntegrityAnalysis getIntegrityAnalysisByComponentUuid(UUID uuid) {
        final Query<IntegrityAnalysis> query = pm.newQuery(IntegrityAnalysis.class);
        query.setFilter("component.uuid == :uuid");
        query.setParameters(uuid);
        return query.executeUnique();
    }
}
