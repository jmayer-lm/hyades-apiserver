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
 * Copyright (c) Steve Springett. All Rights Reserved.
 */
package org.dependencytrack.parser.vulndb.model;

import java.util.List;

/**
 * The response from VulnDB Version API will respond with 0 or more versions.
 * This record defines the Version objects returned.
 * Record created to replace the model class defined here: <a href="https://github.com/stevespringett/vulndb-data-mirror">...</a>
 */
public record Version(int id, String name, boolean affected, List<Cpe> cpes) implements ApiObject {
}