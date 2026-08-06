Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021113.outbound.protection.outlook.com [52.101.70.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE0427BF93
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.113
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033661; cv=fail; b=WfDNFV9LycPmn72CzYSn0a66F617GnKkVVhhn9qXm265IHeZMRbqtznZbRKDnHkUFRctAkfVP/F4VbgfKohN6Rb6RIkD+Np9pt8D5eGqTJ4w7gjVoLhhThO4OVxC912xSopUV9VzdbTRdUHQamXN/7Yw4+DWFaFdbkEM8dRHde8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033661; c=relaxed/simple;
	bh=R7WsLCnb7hSKxRx8UUxfg4sSD/vqqumEgSZvw9DDzcQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ig2P95S1Fvu/icT4QJkAUWM60UZ/8gtP2tJtxYMBjRw30azZYUjj7E6rn+zopSW0LfhXmd4XXyhtTz+CHN0KeqTZdz14QlEYHyPRm91kTEr7KwuGd2W4j1AtD74b8stZAqGUWWTKuKtt9q8fNPsjTFcV9nZ/pPA3Gv1D1xIc5HY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=g0zhUCa4; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=g0zhUCa4; arc=fail smtp.client-ip=52.101.70.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="g0zhUCa4";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="g0zhUCa4"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NEcmdrQJGzPRkIeZ177KDGdmVi3zfeG5EevS8hwjZS4Aj6yRsJsPGlLMcj+eKknG9Vb9TsFV4/Y0wR6+iIep572c9SuMfPvFn51L3W7EvPO/Fp04cj1doP9g+3fHZ9DQKING57e6raLfY3uZWRfVeY53GHNYVHOOlfZ4rWupNJCeqajXyyi82gq18y/ePPBQEUma0mIzHcNwHvGtr7KzhzAWlESzuU8oKfSJHYQxl5ZmvjoMFGQNgyUy8irIjSXSqXc9M2wEqm2PEL9uhemI4HS3MPKAbXMGBgYHa6f8q3hNN2E/MNxMiJUeMWrw9BuAE3knciewsc6CwriZpyuHZw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7WsLCnb7hSKxRx8UUxfg4sSD/vqqumEgSZvw9DDzcQ=;
 b=s1NnMQSyJ+k+N+eqbXN2c5C2JJbiL66x59osJciDbUc4TaiOExkl11IeO1OjQGM8qGn0YTllXZkm6yK4YN0g4TxoIoRUhKGUS2GhfmV4otHpt90QJ1+4Te5crmNGkodmLLeSUxdfYcWTOPfSWK7UJoD9H+8jIlx0Di5puZ7OvryFu6t5fMfFZ6/cnSsWVGLwipOW2hcvZD26ji4PrG4OUHr+rgJo5mw/FlHUY37YAnU2PUFZD1MpE+AcrF4EFFoDu6qg4TZeiGeU8Y3PCD22QhpkCRO1D1cuSMwpThjLLKRnEqNzErGKW89JgeL5BqaTV31j4bsizaOksyWeG9fX+Q==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7WsLCnb7hSKxRx8UUxfg4sSD/vqqumEgSZvw9DDzcQ=;
 b=g0zhUCa4+yyxk9mR/FQVmUOtxbYcPM2aaRiE0LeaxYhYDOe8VppKQpZV0FXtWglTTd+T+eOk3AgtFA6wG84I8rg+pvYC9l9qCYkoCSkusqecw3kKIfTirS7tqmZU772iUMtskcIUfmRb8QCPb4boFBywi4wZipLEXK01tkGB44pfjazHr5KZv5qsY3h++Dq0HzfDSv6Y+Xoj/hWK27HM4GB85lFusnJHbwEynGsE6gA+iUxFksPSPCa3RXghW0n+dw9WCvIqPojxoNj4/mrOLsJQibPXhW4jkklxIU4Lp7Q5+ZuQEu1U0PWOOVX3qKQphFsyZRHEYlBCzJOx4COwwg==
Received: from AS8P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::30)
 by PAWPR04MB9861.eurprd04.prod.outlook.com (2603:10a6:102:381::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 16:27:34 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:330:cafe::48) by AS8P250CA0025.outlook.office365.com
 (2603:10a6:20b:330::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 16:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Thu, 6 Aug 2026 16:27:34 +0000
Received: from emails-1558669-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-106.eu-west-1.compute.internal [10.20.6.106])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1B3B680497;
	Thu,  6 Aug 2026 16:27:34 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Aug  6 16:27:25 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786033654;
 b=Ww9m7QzhHjlVGmiHj9+HAphoajM3/dB6ut5xX2LepeneM3FzdFQ+d3hDgrX2sOLZJo9W2
 nP5BYFvHBuHzpgVSl3ISeZwc1XpQXb5fEmJ5OtFqszhv6+jjB0jokWE9ysH6p5BiBzLAB8F
 yglNJywTYiqPLrseCxhGwSn8P1ZVAvo=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786033654; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=R7WsLCnb7hSKxRx8UUxfg4sSD/vqqumEgSZvw9DDzcQ=;
 b=B3g/pqAfNW35UKJDLk2EaxQCWHp8u6N4RnQk+y/ccQMFVWAA/dKueVq8kX6W1g5QTqb3U
 hbNt3sW14iNgJYlJ7jTWzJ7zWI1AOhn8fVDZdHt/UsWkPdoKftE6wsYIhTDyxofdzvr/S47
 YMTsucRBHOKh0yZT6sX9ixcNd/RjJCk=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7WsLCnb7hSKxRx8UUxfg4sSD/vqqumEgSZvw9DDzcQ=;
 b=g0zhUCa4+yyxk9mR/FQVmUOtxbYcPM2aaRiE0LeaxYhYDOe8VppKQpZV0FXtWglTTd+T+eOk3AgtFA6wG84I8rg+pvYC9l9qCYkoCSkusqecw3kKIfTirS7tqmZU772iUMtskcIUfmRb8QCPb4boFBywi4wZipLEXK01tkGB44pfjazHr5KZv5qsY3h++Dq0HzfDSv6Y+Xoj/hWK27HM4GB85lFusnJHbwEynGsE6gA+iUxFksPSPCa3RXghW0n+dw9WCvIqPojxoNj4/mrOLsJQibPXhW4jkklxIU4Lp7Q5+ZuQEu1U0PWOOVX3qKQphFsyZRHEYlBCzJOx4COwwg==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB9462.eurprd04.prod.outlook.com (2603:10a6:102:2aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 16:27:22 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 16:27:22 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Thread-Topic: [PATCH v4 1/5] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Thread-Index: AQHdIA+YeUqcGl4770ejpdsevsJG9baF4eoAgAte3gA=
Date: Thu, 6 Aug 2026 16:27:22 +0000
Message-ID: <caf73060-ce7f-45c2-b5c4-d82a1d654c26@solid-run.com>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
 <20260730-rzg2-sr-boards-v4-1-08bc459578dc@solid-run.com>
 <20260730104856.A190E1F000E9@smtp.kernel.org>
In-Reply-To: <20260730104856.A190E1F000E9@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|PA4PR04MB9462:EE_|AMS0EPF00000192:EE_|PAWPR04MB9861:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b221ba1-8361-40af-a67d-08def3d79ef9
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|6133799003|10067099003|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 SIKAHHxnPNQClFSKBEFB0FwPEoTGL1CIqOHpQrZIgIdr226UXQaoB0CDk9A4gkKVyrtJZ3V15Ys02DzuHfGbwu6se2yn9onWVjXHS4To+FXLUPWoxcUUxNExJNexZxA12Kv72Etb7sxYf0fgH2X9MrkpBG1UEvffaqnkyL8/B4UsOem+Xm6GxC1gtg7AUkv5Depkd65zF6sPYyAYfFEB6KGp8IMdaEADI4i1B2p5mKjCmZqqq90Xyebu/86/fyzU/KMJId0Y2wqHtCetfmr2kJ3sr8efaSM72mbafNB2cWhzYl26DaP9/h+1QnIBqoLPY9IVbCxcYXrsSLQ8IOb/e7MCi+t0tc5vKRq4cH9AMuqVVTIyPPMXCqWLclvjecJEMbUYx9cVb+dD4Cv/yGvrAhBCeH8tTt4J3CGvsXON+sX1jsOKvhqkVcqqxHyeFPDnLRo9l31wSgS8GpUcMbvjjwh9jQTH6PtkOAx+3F2As5zHICfc2vRwsaGCspRb03j8oXSCwfZiEYoF+NnpS+GlvTLU2qQf57oG5lsbkRmBufax6L2BF76QdehPCqG/BG1OFqm+NiNRSvlZnaflPCRAk390BYgVgtq8RChF6BJFgx10rM5xM/n1hYn1T/3J8y6/BthnTlHgBws5r29OOCKgCFo7tCZU+EfX3YFhl/WwuBGIef1KVnFkdkB6gCKR3fDWc/51sAk//yM/l30xM7GVaQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B844087698AD04F87BAF8B17D1ACE02@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 g7ABtk+qI5ZIWC7Pw1s9tmOoUuIolQiODdX1JSpkjXyu7EyVjGahXP5z+IyN1rgU7qpVbJ+dKRx2p3pCtm5LkD/W0VGNyMltyEVK5MpfEeJRvEi/cwGL08j1bVfHgiC6vZoIps1uKrQ9qUKniUnACWnUTZQ3YHR+yMmbe09+5jdJhs5lqtX6qZqFGwsydVb+FP46LddR4cHXsSF8NC8UktqZTG3uYU6hNeN2oQvO4itmLLmLLSDwI1fyxtuEEgdLwRQ0D23nzf9EEcJewW5jQb7i8RyLeePQ6/ODMJbdMqhXfAkIb5jSLOhZU2Y1J7ctxJR6qzelh4X+OiW2EHuN9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9462
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c293648092204ab2b1c7567e2d9a7710:solidrun,office365_emails,sent,inline:205d1555f029ec72001a1b4933c5e88e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKeIfp5YeDpYnW5ArMV8XO1EdLJhP27BB665xsd36a0Q0UT8TEmd+8FB7yTn3iYypn1wHyAf2b8XCZ4dAvaMLlMUh2CBEYCWUKs5hmZfAFs54qrDuUvsYuIujvuTT80WP0guaDchqKGcaZeWQ9BvJfR6Uz8Br3DXDhP+9kqsrVOX69ugbqlnmEMkytdcl4rGi/aU4HQ6NVMPab2AzvoHsvTWsho99QWRuL4WXnzzq1ZHOOMCVN6QxZKHOQ+Tx+G1uCQf0SrFfHHqxN/WA1FmF0BEFjS3I0aCMC73CGCY3xinFH3e3w5B/AVFp/QF7ih68K7cLuhaa9kCTwAVL80qBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7WsLCnb7hSKxRx8UUxfg4sSD/vqqumEgSZvw9DDzcQ=;
 b=MJgnPGROMDNJRPnu/FhSBGu9kxob2hxNIYQqTg+vNF+bHCURGmuHETNPzCMwlRa2bPgc37w9LP+G3KkQ+bl7ukqehNdkJEkbej6VD0ONDsxrxM3kJwppaLCL4RZPDDfTsSzGJE7MPd1580Nl6U1WXZBGYrIm1IffucErYnhqRixedtGfUESbiUVkPs0UXNlJuQpPu+mCOsNHyX7X2MUsmIqK5oSf6umuKZ0nucnOzxHozYZH1p93qawGcIjwZldfGgpLi8Nc8eARO19GilObD3LK8B5B4F0FZtJIiOuLyenveTiD1MbrVKoPpZ7eSx47b9Dr1v3nhcmu+nEhZgQfaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9eb8a7c9-5bd9-4c8f-0579-08def3d797ec
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|1800799024|23010399003|376014|82310400026|35042699022|3023799007|4143699003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fB+uwuzGD3hfMtdPsGstchUdBgyXyv5tRMuIljDY41PCDCSGMDH4WZfTKCCy59eQmi8TQHFRSlQzLW3HdnSx9KGhQYCqaW82XxAO9XScd/kCfE1Q4TM4V9v8G/6s598qVTtKEWPWa+BLl9IhV+WprGg74WZZZOTkrH2mLfyWH/qxxxHuYzmWfeB/U8HsFIqdfQWDOmumT1pngVQOQ0Bx2Y4p62oZmQmECHknNDSkwvkDKN5CHo3EZ47Gn2CYCv2snY0isrNT1m8E05p11+ifcvW6yUmtZZjHhvZQLgaDXowvkqHmHop43QJztFlZrpjVA/DWLl1Xn6FZlMeqIUD8PO715O6iueTnO7HH1YOz+RI+4LwK8RrH0ZJmsYahQ6iv7l2kCXT6ZV6Ura10UQmBMAhZf9OTyUvXbOUlKIM1Gbz2YfVj8Gv9FVH6s+5WqD3oNBy8yxECEfBASaxzjKbXQjZDtV5gVwQEc6Ld9rJBwVVHFBHyELcYMLkzgUAIAxx1d1Ai+pK4WMzo4As6/YXoKIZsBUo/zBKx3PqZgfta434w7TrFMMw6RGQJe6BaoI9RQ4RtO1tlvwjH+c7f31AaxQsy/RBA5sUmrUlQPM4VzjydaibDpPOMNZzTcUKRGmVOCEDvoHTIvzT2MTy6V0aZqFagzJlVWcWriOTFnZ38OwGsfyEtZwITFxDFet5cXpz5CF8df7CG84FtkWTFcI794Q==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(23010399003)(376014)(82310400026)(35042699022)(3023799007)(4143699003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iAIu+6zlBv1HQzsWjCSWtuLpOQ6ynv99AM3G6NULtEpbUYZ4kIsNVaPZvQTg6oRoETyOVXgYwtkazFvEQhFnkRM9GjhmmgLM7iCGDb++k+cPfD45ltowQ8hvrwkcu9Xc2pXOg+HNw0vCuYOfyZncGts0n5JFhpCwEmNuMtXrc1GSGurj4z9lzs8YpHGUGIwtU8VO7IzflskxlZJo3b6BWbdn23AvoQHBXn2Nyhok6oOw19b4uBmjAmVq1qTUFeeRjYnhNxkpE+5LPvCQpgvpMqBBLrnx+MXFatIsxab3WaAxo3PMsfmQOS+W+p9aIUXy0Ssm4dTphK9/qy7fuQ5OnaaUg03Ri8JdoV1pk76ZpvGbjv03LD079rH6gVNpWR/VJ25wVgDsjgaDdOAnfEEFxC3iyhvtz/spI917thN5wdPEjh4+todQHoCjMm+jMUT/
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 16:27:34.3017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b221ba1-8361-40af-a67d-08def3d79ef9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9861

T24gNy8zMC8yNiAxMzo0OCwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3Rl
bnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW01lZGl1bV0gVGhlIGJpbmRpbmdzIGZv
ciBTb2xpZFJ1biBTb01zIGZhaWwgc2NoZW1hIHZhbGlkYXRpb24gd2hlbiB1c2VkIHN0YW5kYWxv
bmUsIGFzIHRoZXkgb21pdCB0aGUgMy1pdGVtIGNvbXBhdGlibGUgc3RyaW5nIGNvbmZpZ3VyYXRp
b25zLg0KPiAtLQ0KPg0KPiAtLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggdjQgMS81XSBkdC1iaW5kaW5n
czogc29jOiByZW5lc2FzOiBBZGQgdmFyaW91cyBTb2xpZFJ1biBSWi9HMiBiYXNlZCBib2FyZHMg
LS0tDQo+IGNvbW1pdCA1YTgzNzdkMzNhNTdmOWY3ZTMzZTdhY2E4ZmM5NDIyZjY3MmJmNzJiDQo+
IEF1dGhvcjogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+DQo+IGR0LWJpbmRp
bmdzOiBzb2M6IHJlbmVzYXM6IEFkZCB2YXJpb3VzIFNvbGlkUnVuIFJaL0cyIGJhc2VkIGJvYXJk
cw0KPg0KPiBBZGQgYmluZGluZ3MgZm9yIHZhcmlvdXMgU29saWRSdW4gYm9hcmRzIGFuZCBTeXN0
ZW0gb24gTW9kdWxlIGJ1aWx0DQo+IGFyb3VuZCBSZW5lc2FzIFJaL0cyIGZhbWlseSBvZiBTb0Nz
Lg0KPg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b2MvcmVuZXNhcy9yZW5lc2FzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL3JlbmVzYXMvcmVuZXNhcy55YW1sDQo+PiBpbmRleCBlZWVmMzRlM2Q3ZDA3Li4xNjcz
MDA1YTNkOTMwIDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NvYy9yZW5lc2FzL3JlbmVzYXMueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvYy9yZW5lc2FzL3JlbmVzYXMueWFtbA0KPj4gQEAgLTUwOCw2ICs1
MDgsMTQgQEAgcHJvcGVydGllczoNCj4gWyAuLi4gXQ0KPg0KPj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IFNvbGlkUnVuIFJaL0cyVUwgYmFzZWQgYm9hcmRzDQo+PiArICAgICAgICBpdGVtczoNCj4+
ICsgICAgICAgICAgLSBlbnVtOg0KPj4gKyAgICAgICAgICAgICAgLSBzb2xpZHJ1bixyemcydWwt
aHVtbWluZ2JvYXJkLXJpcHBsZSAjIFNvbGlkUnVuIFJaL0cyVUwgSHVtbWluZ0JvYXJkIFJpcHBs
ZQ0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBzb2xpZHJ1bixyemcydWwtc3Itc29tDQo+PiArICAg
ICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscjlhMDdnMDQzdTEyICMgUlovRzJVTCBUeXBlLTINCj4+
ICsgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyOWEwN2cwNDMNCj4+ICsNCj4gW1NldmVyaXR5
OiBNZWRpdW1dDQo+IFdpbGwgdGhpcyBzY2hlbWEgZGVmaW5pdGlvbiBicmVhayB2YWxpZGF0aW9u
IGZvciBzdGFuZGFsb25lIFNvbGlkUnVuIFNvTXM/DQo+DQo+IFRoZSBjdXJyZW50IHNjaGVtYSBp
dGVtcyBibG9jayBtYW5kYXRlcyBleGFjdGx5IDQgY29tcGF0aWJsZSBzdHJpbmdzLCB3aXRoIHRo
ZQ0KPiBmaXJzdCBzdHJpbmcgYmVpbmcgb25lIG9mIHRoZSBjYXJyaWVyIGJvYXJkIGVudW0gdmFs
dWVzLg0KPg0KPiBJZiBhIHN0YW5kYWxvbmUgU29NIGRldmljZSB0cmVlIGlzIGRlZmluZWQgd2l0
aCAzIGNvbXBhdGlibGUgc3RyaW5ncyAoZS5nLiwNCj4gInNvbGlkcnVuLHJ6ZzJ1bC1zci1zb20i
LCAicmVuZXNhcyxyOWEwN2cwNDN1MTIiLCAicmVuZXNhcyxyOWEwN2cwNDMiKSwgaXQNCj4gYXBw
ZWFycyBpdCB3aWxsIGZhaWwgdmFsaWRhdGlvbiBiZWNhdXNlIHRoZXJlIGlzIG5vIG1hdGNoaW5n
IDMtaXRlbSBhcnJheQ0KPiBibG9jayBmb3IgdGhlIHN0YW5kYWxvbmUgU29NLg0KRGV2aWNlVHJl
ZSBzaGFsbCBvbmx5IGRlc2NyaWJlIGNvbXBsZXRlIGRldmljZXMsIGEgU29NIGFsb25lIHdvdWxk
IGJlDQplaXRoZXIgaW5jb21wbGV0ZSwgb3IgYSBkZWJ1Z2dpbmcgYXJ0aWZhY3QuDQo+DQo+IFsg
Li4uIF0NCj4NCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTb2xpZFJ1biBSWi9HMkwgYmFzZWQg
Ym9hcmRzDQo+PiArICAgICAgICBpdGVtczoNCj4+ICsgICAgICAgICAgLSBlbnVtOg0KPj4gKyAg
ICAgICAgICAgICAgLSBzb2xpZHJ1bixyemcybC1odW1taW5nYm9hcmQtaWlvdCAgICMgU29saWRS
dW4gUlovRzJMIEh1bW1pbmdCb2FyZCBJSW9UDQo+PiArICAgICAgICAgICAgICAtIHNvbGlkcnVu
LHJ6ZzJsLWh1bW1pbmdib2FyZC1wcm8gICAgIyBTb2xpZFJ1biBSWi9HMkwgSHVtbWluZ0JvYXJk
IFBybw0KPj4gKyAgICAgICAgICAgICAgLSBzb2xpZHJ1bixyemcybC1odW1taW5nYm9hcmQtcmlw
cGxlICMgU29saWRSdW4gUlovRzJMIEh1bW1pbmdCb2FyZCBSaXBwbGUNCj4+ICsgICAgICAgICAg
LSBjb25zdDogc29saWRydW4scnpnMmwtc3Itc29tDQo+PiArICAgICAgICAgIC0gY29uc3Q6IHJl
bmVzYXMscjlhMDdnMDQ0bDIgIyBEdWFsIENvcnRleC1BNTUgUlovRzJMDQo+PiArICAgICAgICAg
IC0gY29uc3Q6IHJlbmVzYXMscjlhMDdnMDQ0DQo+PiArDQo+IFtTZXZlcml0eTogTWVkaXVtXQ0K
PiBEb2VzIHRoZSBzdGFuZGFsb25lIFJaL0cyTCBTb00gYWxzbyByZXF1aXJlIGl0cyBvd24gMy1p
dGVtIHZhbGlkYXRpb24gYmxvY2sNCj4gZm9yIHRoZSBzYW1lIHJlYXNvbj8NCj4NCj4gV2l0aG91
dCBpdCwgc3RhbmRhbG9uZSBTb00gY29uZmlndXJhdGlvbnMgd2lsbCBsaWtlbHkgZmFpbCBkdF9i
aW5kaW5nX2NoZWNrDQo+IGFuZCBkdGJzX2NoZWNrIHZhbGlkYXRpb24uDQo+
