package org.apache.zookeeper.server;
// Copyright (C) 2014 Nippon Telegraph and Telephone Corporation.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
// implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.zookeeper.server.quorum.QuorumPeerMain;
import org.apache.zookeeper.server.ServerCnxnFactory;
import org.apache.zookeeper.server.ZooKeeperServer;
import org.apache.zookeeper.server.ServerConfig;
import org.apache.zookeeper.server.PurgeTxnLog;
import org.apache.zookeeper.server.persistence.FileTxnSnapLog;

import org.osrg.earthquake.*;

aspect PurgeTxnLogHook {

	private static Inspector inspector;

	pointcut calling():
		call (File[] FileTxnSnapLog.getSnapshotLogs(*));

	after(): calling() {
		inspector = new Inspector();
		inspector.Initiation();
		inspector.EventFuncCall("wait-for-1797");
	}
}

