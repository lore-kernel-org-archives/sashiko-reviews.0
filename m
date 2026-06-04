Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EE5317147
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 19:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780601013; cv=fail; b=Y8OdGmzYQJ5m5bDwnRaw21FAL1K4ZNkgmwikGfeBWLyfAnRJwWIkspKYYyNtp0WIx2QUymt6m05RmDfG+ZVVeoi4hTDziN4qRKHZ65JGC6D19g9NaprxmTXqS/+Vi+VwTUOGxijimqD8Ecgywop7JkC3cogJgSn7l0+hX2JwvRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780601013; c=relaxed/simple;
	bh=VUvYAPv7CyIwmmGqTo8u87uCFS1smUjM1su2Ld94ZF8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FB0d7pLwVSO32W/olXkT6kIK8GdG8jkugp/Zqj+YDCLx4uxkXwYTrF6gkMBC3GECqetMEFC+fSliIMhCFUwbGynx4FNQVv4TUmITrExBqbs4OaimicjHB4K4TO6eYmbBJlYReNLeHeEgKNC5As8pUIXBIK5+9veb6waRgHriZgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N/mbkNmV; arc=fail smtp.client-ip=40.93.196.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N/mbkNmV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kybv6u+azzb3CdDhWvaVPqfWF8q21Iv4rMtIzh2h1M5RENMQmGIRutHMY0HXptRK3JqXb/a7MtE0bJ7j/2Q386MI+j3Nklv6ef9bNIVl9syrccaDc3tLX95EhE/tmqJa7xD516JMxnqHBpm5gqIkverttJjcZTMt4dJph27YXb3+vEq8mhi3BwKhNtiCB2eUooQQmAovl8mYzKurWUTbGuYH6CVOWWK7BJCM2LwYUU5ELvPL846M85JBsHtziDQxP+NEcPMSKebE5wjWe/8+WTFkDtY4rDDyDkMOctpOgsn4K5vhNxQFe1xm2C8gNjW29lC3OG1NWilwkmQu+Qt6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtMsNLki7GwVZz/kHCAQ2mkvf3KYmqc92DQiNG+rfhc=;
 b=yYSIrm01SzA/1JesPE/Bjp7lcLfTpc0WBOSmvc3BXVvXgNVVrUPmSJuGeSsdxr+bfO4sfTjAptF5svXNoqlzMRTuJy8zQZzPEa5CZdagRINZreVEVpjezfh5krj8vtwJ11w8MwQCBzIHtPOanWQFwMCJNsM5Ayl/OvDLGkY8O+LEGbW8RBZ13pBdITfculbJwfPp6L+V+8bEXQGu1NfKD1GO6PkatlaU5sgVXfbBOdTVrsSpUXzt+6vCuGLOtXa+vTcpVtPlZ8PuwF5OjXO9HuAnwTVbm5j3twR1xZrivoiPk1M/1gbiFICs5i1uEKaakY48P5IzUj+d8+hGN88s+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtMsNLki7GwVZz/kHCAQ2mkvf3KYmqc92DQiNG+rfhc=;
 b=N/mbkNmVia7WqYYXWfJm+upToCzxKnSiB312ysMtnDyWpPnN+5jeI+e3/ZCkpF3n9+EQqH8IYIx+gHvzTn9bO6Co/s6qLJqaXAniBaz8Evzo+rCwH0PcbIyYz8ytbmIhmUuqYv8CTmS29djvCYDu6kqPxv37gL0GirUOiVJA5+IhIwimqKLtmwuHghRCbwPE7OEq7uY49F9rgoXOAHr9oFGtJ7Q6dD5PPAFKlwI2/tq9R+wlmYfi0CpwuEzGNILoPWvzvg7ilWOcONtegPS1S15NSgoHRBvbYpNXNXG+3WZYIJDKtJPqcqcNrIMKOsFSJD1qz0DhLpr3rIYGrXLt+A==
Received: from BYAPR21CA0011.namprd21.prod.outlook.com (2603:10b6:a03:114::21)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 19:23:24 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::b) by BYAPR21CA0011.outlook.office365.com
 (2603:10b6:a03:114::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 19:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 19:23:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 12:22:58 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 12:22:53 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <sashiko-reviews@lists.linux.dev>
Subject: [PATCH 1/8] rust: firmware: add Firmware::request_into_buf()
Date: Thu, 4 Jun 2026 14:22:42 -0500
Message-ID: <20260604192242.2318519-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2c1ba2-8970-4618-fc7e-08dec26ebe76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	+XJJAJ9+bVUd1ubKt74kkDxuRt+ZN+v1iHFK6gFWto/AZQg9SwjKlE5qTbkoI1PuLiM9PnNn5zSzRCTVLIaoe4Au5M/3DSsZIJdNT0NZ4LeI7RjUkBify2886TvQmG/0W/hJ6iqyLgaW3ipz707YHHWRiK1hugcJVni19r2E3omPdkjxG4tOfmfRJWgHyNvtroUmKYKxtx9EedeLeU+Ht+JzE/1rw0zYvmOV/wosZuIMkzLXlSJij8C6f8T28ht/6MJSv++Q5Nl1uw6XXouK0FG1s9lGx2bILLXyqQOK349ql5Qe9I3bsfIOdmqO8PjidRbwuHoBwwLEFNs27uBOmXuLE4cKurrCsP9NDj4uP+bA9zQEr92D0gIC21DHf9uKI9J5xYtTdh5v5zEUPkLK0L4BCNJL8faW/atnxz4UGtUuGfzxcj9NPpKahB5TW0GTTLWWEtRfICEUolvTlhWqWtqzzVlZkPYzIqcd3Sf8lTW6IPVZ4T1vjD7BLHFB7K9+KdJ43PzbYW11+UPz4VxqkAObj6RrueSd314eJDttyKoA3wrGETLTI8MnX8/9aU9l4WX3W6o38qWkLWdWXzkki7+bvrG4h+BC4VVBNEhQQ1uzDQpCqbnG9PJkxDEKmw2LRZYc1m3KE7DP23/JM8kqqia2NnS0Wkd9Lhf5Ft1GN9+YKOIhqfuGcfnHIYGG9rVkXfpEc78SvjYGhwHlyhFtxJ59j2JJRMcHhxN0oiWXA74=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L82M6vUE8ZxhX10QSiWjsTTt/MAtXHsWhULddhcv3uprAGc5c3L1Rf2bpPRaKuLS8ARq2Gf/Y8jpcEz6vHJXxbfJ1lfGa9BuKTRHO4kVLMyvk/lR8F1gTx7B+VTeZ7efmCeq3hg9syjqY+CVClGEWwyj2qu3TvYhhkkCegxaV/WDYP2lHftRx3aPuTMVCo7qAWujee4IBGf3it5/7AbiGKHsmtKN+ud/UMV/cHUaEUlIjxUzSScG3gTqGj7KfYyggT3tIwXfnLtha+u3tMmhUxljyeIrjN0Sy26MojILtCLWMcpP3f/1yiweTXpGgqo6gy8fetzK6lPZHF8gzIlPa4Z6cM4z1c9Co7vMjuByxHUKtyalKlZmw8hjllE44kuzwO85dWI4WEm75NkYsMNs4Lqq4Ud9Nm90RdJsT5KfBWhdamDRL3rzf/1XE3YhC6HP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 19:23:22.9280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2c1ba2-8970-4618-fc7e-08dec26ebe76
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470

Add Firmware::request_into_buf(), a Rust wrapper around the
C request_firmware_into_buf() function. This variant loads the firmware
image directly into a caller-provided buffer rather than a
kernel-allocated one.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/firmware.rs | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..d5130ce0fb4c 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -94,6 +94,34 @@ pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self> {
         Self::request_internal(name, dev, FwFunc::request_nowarn())
     }
 
+    /// Send a firmware request with a pre-allocated buffer. The firmware image is loaded directly
+    /// into `buf`. See also `bindings::request_firmware_into_buf`.
+    pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Result<Self> {
+        let mut fw: *mut bindings::firmware = core::ptr::null_mut();
+        let pfw: *mut *mut bindings::firmware = &mut fw;
+        let pfw: *mut *const bindings::firmware = pfw.cast();
+
+        // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
+        // `name` and `dev` are valid as by their type invariants. `buf` is a valid writable
+        // buffer of `buf.len()` bytes.
+        let ret = unsafe {
+            bindings::request_firmware_into_buf(
+                pfw,
+                name.as_char_ptr(),
+                dev.as_raw(),
+                buf.as_mut_ptr().cast(),
+                buf.len(),
+            )
+        };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        // SAFETY: `request_firmware_into_buf` not bailing out with a non-zero error code
+        // guarantees that `fw` is a valid pointer to `bindings::firmware`.
+        Ok(Firmware(unsafe { NonNull::new_unchecked(fw) }))
+    }
+
     fn as_raw(&self) -> *mut bindings::firmware {
         self.0.as_ptr()
     }

base-commit: fea3a2dd7d3fc1936211ced5f84420e610435730
prerequisite-patch-id: 8dc40be41df9e332a885e2f86d4d508f9b978d19
-- 
2.54.0

