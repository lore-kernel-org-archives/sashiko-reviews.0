Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021087.outbound.protection.outlook.com [52.101.70.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E10B2459EA;
	Sun, 24 May 2026 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.87
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779626244; cv=fail; b=s2wQhZ4TsyBQMWmg7FAxgOmNgST5r/f5dTggTPMqJNtJSTI33CXvBSeP4OBEoq+OGyzYwbkF1TAecTmUXaSJnt8FN9Ff6f44fv3JOYZRQ27HaOQNZNfQopGpacwlZXMAeZWBD83G6B8TueZvlfPipuP7P6JrcmRqA1ttictyGsQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779626244; c=relaxed/simple;
	bh=tIKvdsvzC6TcwwEg2mqkvix0kvQ/Zag1PNdWI9bn0y0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LPktbpkNbUTI0tq7Yg7Xz5Uem2xF6qjLjTJ5BQTr3+gAGRiskguYsDAeCQLwcU8jPXgU2yeGX9m6yeFjpDRqTDIPPN/0yikSU7HjOuxmUcAKdasfHRzdhAMWQ7n8V4BZn0dL1YuanRIA5RvFmJo6cB5NJeq/otvYOsAvCbpUJyE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DW/3XkQ4; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=DW/3XkQ4; arc=fail smtp.client-ip=52.101.70.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DW/3XkQ4";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="DW/3XkQ4"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=Siy7A4gEll8sbs6j5Vzfzs+yG4jA8BKMvwpxJCrupPTSQDE4M9YR1Tgl+LsVAquBFVGcq1EmbBZYAi82v6YPUvMFUq29MO+TBHNuB/F3q5TaKRfU40dsVIuDeOZybNkauX5KkI/nKzsDHRZb3ltUtF/bBjsuIX4IlJlyUYeL65kQphw98M247QrBigzCPZe1sFD0HY2kO2SUyjCkZ1nlP+bHH/stcBXx6yS2NwFar6HcZBH8d+yCQ63ACE3c1dhyNmAxPQ4ClFfWjTTLP2sFQA7oz/ozj3/44E3uQ3sgAotaQ9PD7xsUDq/VmboVpizzAwv6mk0TKMdnSsY+esVVrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIKvdsvzC6TcwwEg2mqkvix0kvQ/Zag1PNdWI9bn0y0=;
 b=AuEM9zps+smlBEkFtnMW59y6k1B1hwXCz63i8ECgBIvW/tf+AuQBEVhlPvYI4NK6ec6D2BRPN5xWgPLkFGgC7uzzZ6PeEBJ5XOSdI0g3IbnNzoc7cfzj5u2Py4nyhXLyiGrvT0GAkurvkjOhxTmd3/9uIMd1gRKa8FkOKcA2D6Cr7useRe3GeWwcGqN3r7V3NuPeAykTKG13kTy0rqX15bdaA3t2HaxoBLgxEYQcwjNZd73UkbZoCmxtD6KoMnDWYnA+gg+UMyy1a02kthSREs5WGdRWRTdHExj08n3UFKhr5uRE1kk4Kd6ul/fNlj1NSTK8E1gF07nXiyDRMsIs6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIKvdsvzC6TcwwEg2mqkvix0kvQ/Zag1PNdWI9bn0y0=;
 b=DW/3XkQ494MPLn3OJGTCZscjHRqGC6PBamh3JiaDe6ccujQ8I4HroPAvsyZBLvrfiQnGrdk0fFSPqc18vBKW8CJBxkERe1+d2Uf3omBXgMXyN9RTY9NsHditCdvcv955vSPiLmT9eevcCtTTD8lny3GF4TJNKfpiv/0pWsFDwYZkKW+Z+eYHhjU/7XAfOwNDbXvR+6CwT8sXOYh1anz8R8cepeT6Gw5Je015IXso860FAmMHa/21pk/WILWPWteTZXV1RjU8v3ihCop1LypzW7/HbdqRW0a+FXV/g7JAs2JJmxzYAVlOUKVCbPXm8cjSrrHtYePxoXAoQj4MMor/og==
Received: from CWLP265CA0347.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::23)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sun, 24 May
 2026 12:37:17 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com (2603:10a6:401:5a::4)
 by CWLP265CA0347.outlook.office365.com (2603:10a6:401:5a::23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19
 via Frontend Transport; Sun, 24 May 2026 12:37:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 12:37:17 +0000
Received: from emails-118279-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-170.eu-west-1.compute.internal [10.20.5.170])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id F0D1D7FE3E;
	Sun, 24 May 2026 12:37:16 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 12:37:09 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mm/BwHeEERNPGl5qN9fH+qoDG/JGwGUuBl+ymvFLV7eJMBhC1mzE6t9nkqnGIIDC4qFXjD9YzCyKzncdGZCJyZ151PCAYgwJd3XfEbPxySc/Ys8KlLB5XIKPor1atfR9LO6hIiFQHsBFjk4nzOI60L4sjvVmuCek619ftEpb5YF9AKa7098u/V9nYcOLuMOQE91cS7g+067S2Yct+NFUocL5RCekGrPESzual7rRO+w/tUEY3iw4edI9odF3nEkjq156r7Z+D+nKBc+rV5d+vkoQcVtGOik5iHJmvM7ScUNKxJpJGii7nPCQiuE+ANmZU5P6z9ldfDcYwu5aGowlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIKvdsvzC6TcwwEg2mqkvix0kvQ/Zag1PNdWI9bn0y0=;
 b=GXxnq7T237jHvkCEaicTxjLRq5q3Xai8qwfdnF2iLhU17XAiZuZXptojBYRHag511WYUlbdy5VoRInG6Vg1OPBjUOn/HispNlWO0nqKK2BKpwv+e5Fz5lkqxymeasdQQaVsTSsKOaSXkKZ8U43qpxW8CW5q/3B+GL94uUI9l1CR+uUfhoJhj5TNWpX+VhkgfwPlSIuDXf6kTc+J6ZdVjrnd7ir9b54641Ye/0PyKl+R/cN07XtO4BGVpi4gUfuMQrjsO1lCn5MAVt95A9Hte/ENLDFT7Bh1mOpPQtdOPoqPhSq1ooP/Ro89p7khG1WPApaf7vVVSzqt2aj8w06x/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIKvdsvzC6TcwwEg2mqkvix0kvQ/Zag1PNdWI9bn0y0=;
 b=DW/3XkQ494MPLn3OJGTCZscjHRqGC6PBamh3JiaDe6ccujQ8I4HroPAvsyZBLvrfiQnGrdk0fFSPqc18vBKW8CJBxkERe1+d2Uf3omBXgMXyN9RTY9NsHditCdvcv955vSPiLmT9eevcCtTTD8lny3GF4TJNKfpiv/0pWsFDwYZkKW+Z+eYHhjU/7XAfOwNDbXvR+6CwT8sXOYh1anz8R8cepeT6Gw5Je015IXso860FAmMHa/21pk/WILWPWteTZXV1RjU8v3ihCop1LypzW7/HbdqRW0a+FXV/g7JAs2JJmxzYAVlOUKVCbPXm8cjSrrHtYePxoXAoQj4MMor/og==
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by PA2PR04MB10422.eurprd04.prod.outlook.com (2603:10a6:102:417::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 12:37:07 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 12:37:07 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "Frank.Li@kernel.org" <Frank.Li@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: Re: [PATCH v6 10/10] arm64: dts: Add support for LX2160 Twins board
 in single configuration
Thread-Topic: [PATCH v6 10/10] arm64: dts: Add support for LX2160 Twins board
 in single configuration
Thread-Index: AQHc4h0Wqsh7sIQ3fUijPpHX0gttI7YMmpUAgBCVPwA=
Date: Sun, 24 May 2026 12:37:06 +0000
Message-ID: <2a552a5a-3d39-4646-8c35-422b8f58203a@solid-run.com>
References: <20260512-lx2160-pci-v6-10-d0ff72d3c983@solid-run.com>
 <20260513232246.B98BDC19425@smtp.kernel.org>
In-Reply-To: <20260513232246.B98BDC19425@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	DB8PR04MB6859:EE_|PA2PR04MB10422:EE_|AM4PEPF00027A61:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7fa813-97e1-4d4a-3ffd-08deb99130ce
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info-Original:
 +x269RCnBuA5+wpL+seSU1yIvP5nwzDk2Aby/EcNYQiwwkcUe1357etmLcHzsPzFYvxaALopT8/xU/u2zbVViTEOkffNBCok29XLtKdd683Ycw1disszyM5ghdbicSZNf0nB2CPsTLAmjC0cqc32vNbES19/5G3KIc43j1toefOEHMjGuhOIjoiIJO//hEmnazVNn7Sy3F7XN7LdjjlyDkXUeB/CMKTQrOxNBzXjzbj2ebqEHmz/6WaNpAqLGtDM0UPc68xBs7mhtI1k+8o7gftzbMnjrYDl6uTBYF1mnYUBwEszHHqSsNQ9DXoug1CJYxY6PrdBa091k3R3CTNwG9NaYD/fDIzXaR68aGnkI2uVXzUB48MTmPVmXL8uUGIvmaG/lMkyQMsHIM+9fvoLELj/bFvAr7gbdT3s4H17WHyHpoNQspHcdRwXI4asYYXP8iF1ByxujdcdkjfvHVtGEQGajTLA/5EyTBWfCyvbSTn6cecVp5YvpXNjxDqorHynG6jAePGeDp7Q05d/BqoxsM8DMBFSJhCqdnLu83oEibmXRfSnduvjcqCDjnh0QYMys7qJAdeg3lVKPaq5RzXYtH9uDrPXDIBIFpmFMWvJ7cHqM6vyHteigz26/JyKjxjQXEzmMCo65QLU/te5mDv4ZT1rmq7CPd7eBLxSkz9rX8CqjKMGypN+QJiZtrQVgHdRyq95bj6xUVcDDZY5RHvnoToolx0wX3BOVSrlkvL3PmUbdXGl5zomC6yUeBlLAvU4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003)(6133799003)(4143699003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF44360A3B88BC4B83A46347802DFC61@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 dGcDpcSuxfm6yjYpHMKrq4bDq8KscVvzO1Q9emmD4Zv1sYLP96qr/4uBTIQN2VYMuVLR9P0Xb6+rQcRl6dVJk0sz3ehaACeEscDQuvxVFexLwwSI/cBuDOig+9HONjmu60VDi+Yc8vnDp570rbAXULVVed3Zm8Ao/P2wiclENVTkL8mR9sX7Z/jhTayTJP7c9munSwvKbJVkVtDuRwtbWUWwMv2NBJJF031L+8+cB3LH4xsxHwtmXjV9ev8eIDsHhXIa6Jgf9+a1REgvZgyMPywMHvec3/4X+u9NbZmRBpzAzKsQ0ebF4s0Maf05gcpCdtMt4Aru0hcs/1nqFJq7xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10422
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2f16235dc9c44627856827bfbb7be644:solidrun,office365_emails,sent,inline:6d85627c9e828545da0d0e10ba1e4491
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59677d16-346c-4206-d712-08deb9912aa5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|82310400026|14060799003|376014|1800799024|18002099003|22082099003|56012099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	qX31t++FvnmjHLXBG6ts/KEZdUp4yJprqI9oB8rxN9SVQU1UD1fApJ1YVwLl8e71jm6vzB+ro+CF504+PG9pxLv2GAiFyBZrrGM77KTSZsbst/03r1Un3xIpvFrps1JNn6SBha+9Z+GKRyQzsMDnDJ1Gf5BwFovnnQ6cn+v5abePYYOQK7ZcT8DXSOJf5JsiRcS8LKA4ESj+WKT+7JtIjsvIPdShBP3/QDvhUCwFVEc62DvKkIlyQp5N/Dd6EK319qEob46vWi9Px8lBSJonRn5ZB3J9rCK53fji/d4T8ZEq/cO/FxOzKfF4pvmG1v+UiWwnrsa961v37ONcKsBat3ttAxrdycjiEyS9IEm8Aer26RmGSRdwBZgnq5LYkAzITR//Fgn7iplwuO6KTp88rqTzbLnNh+zuym+qiBlHNeRGZOUAoWbZ7pv+5uX9FZ3u8ONCW6lPOFq73iptr2NsG+iR7FQOCu79q/z+w3WYo+MTEITyyzgblWnBCRMJXv6zAUXwIAqsmxf//yck680/ujpp3lLgqxiPTk7xQFLesHsNWeSyFyBb8KWY/mFHniDLxzSJuW/Ta3TMwfHfmno/VC1VZ+/djY8y0JjV+rZxvmd9xstVtl6pBpH4o95ariPmmF6Eb/1/w8uIKG4TcGukc7dk6ccM72E3wezv3KIiTqcDc4AuDlELKy450FPosM3K2MInZP/f9yawNTwcWLfCV7aY6rECyZfhqMCCHvapmwQ=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(82310400026)(14060799003)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lHpWKo0Ja6/Ea2h2IpIKuDsKdCGMsf7fzl8R16tMQT4kLFBo12N5jc0hvC17Jm1mVOnxdK+QBds+2Tw8v0owUApjZxmmDKgi3cQbbS9KXoSyLr9uR/ot6xW5prm4VdBeoSf5EIL3KQWp4p2SgVBPC/UAE0/yhKTYUTJk1xu2asz8xO49VZ5O/11YRjjNNJjfGSUAANdmMZpqwJ7JpHjpHzky+pDxHrbSJ+5n9PUffEqiCGZKCE7jZkT7X0qCn3nk9ZyxpsN01dv/0uhVfN2f/90KZgh4JMEhoKDASqfmyCi/Ggc04J+JUgoEhjVyp1c1LX8/gXljMHGbmNN7rBrTs8bKuAXTUPF6t0wgaynmBrEbyPp0VjrgzHWf7rqTCOnO3Or8dhBXtJ6smsTSdIEMC4K+Kul4nDQ5GHkvzfhLJhiFy2lprMTB1C78C7xQyL/0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 12:37:17.2383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7fa813-97e1-4d4a-3ffd-08deb99130ce
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

QW0gMTQuMDUuMjYgdW0gMDE6MjIgc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAx
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbTG93XSBVbnVzZWQgVVNCIHBv
cnQgbGVmdCBlbmFibGVkIGRlc3BpdGUgdGhlIGJvYXJkIG9ubHkgaGF2aW5nIGEgc2luZ2xlIHBv
cnQuDQo+IC0tDQo+DQo+IGNvbW1pdCBmMzI4N2M5NGI4YTE0ODk1MjFkZDVkZmMyZjQwMDllYzU1
YjlhMzNjDQo+IEF1dGhvcjogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+DQo+
IGFybTY0OiBkdHM6IEFkZCBzdXBwb3J0IGZvciBMWDIxNjAgVHdpbnMgYm9hcmQgaW4gc2luZ2xl
IGNvbmZpZ3VyYXRpb24NCj4NCj4gVGhpcyBjb21taXQgYWRkcyBkZXZpY2UgdHJlZSBzdXBwb3J0
IGZvciB0aGUgU29saWRSdW4gTFgyMTYwQSBUd2lucyBib2FyZA0KPiBpbiBhIHNpbmdsZSBDUFUg
Y29uZmlndXJhdGlvbi4gSXQgZGVmaW5lcyB0aGUgdmFyaW91cyBoYXJkd2FyZSBpbnRlcmZhY2Vz
DQo+IGF2YWlsYWJsZSBvbiB0aGUgYm9hcmQuDQo+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEtaGFsZi10d2lucy5kdHMgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS1oYWxmLXR3aW5zLmR0cw0KPj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMDAuLmVlMTg2N2Y1YjJiNmIN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2ZzbC1seDIxNjBhLWhhbGYtdHdpbnMuZHRzDQo+PiBAQCAtMCwwICsxLDgyNiBAQA0KPj4gKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpDQo+PiArLy8NCj4+ICsv
LyBEZXZpY2UgVHJlZSBmaWxlIGZvciBzaW5nbGUgTFgyMTYwQSBDRVgtNyBvbiBUd2lucyBib2Fy
ZC4NCj4+ICsvLw0KPj4gKy8vIENvcHlyaWdodCAyMDIyIFNvbGlkUnVuIEx0ZC4NCj4+ICsNCj4+
ICsvZHRzLXYxLzsNCj4+ICsNCj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbGVkcy9jb21tb24u
aD4NCj4+ICsNCj4+ICsjaW5jbHVkZSAiZnNsLWx4MjE2MGEtcmV2Mi5kdHNpIg0KPj4gKyNpbmNs
dWRlICJmc2wtbHgyMTYwYS1jZXg3LmR0c2kiDQo+IFRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMg
dGhlIGNvbmZpZ3VyYXRpb24gZmVhdHVyZXMgYSAiVVNCLTMuMCBmcm9udC1wYW5lbA0KPiBoZWFk
ZXIgd2l0aCBzaW5nbGUgcG9ydCIsIGFuZCBubyBvdGhlciBVU0IgcG9ydHMgYXJlIGxpc3RlZC4N
Cj4NCj4gU2luY2UgdGhlIGluY2x1ZGVkIGZzbC1seDIxNjBhLWNleDcuZHRzaSB1bmNvbmRpdGlv
bmFsbHkgc2V0cyB0aGUgc3RhdHVzIHRvDQo+ICJva2F5IiBmb3IgYm90aCB1c2IwIGFuZCB1c2Ix
LCBkb2VzIHRoaXMgcmVncmVzc2lvbiBsZWF2ZSB0aGUgbm9uLWV4aXN0ZW50DQo+IHNlY29uZCBV
U0IgcG9ydCBlbmFibGVkPw0KVGhlIENFWC03IG1vZHVsZSBoYXMgYW4gb24tYm9hcmQgVVNCIEh1
Yi4NCkl0IGRvZXMgbm90IGRpc2FwcGVhciBqdXN0IGJlY2F1c2UgdGhlIGNhcnJpZXIgYm9hcmQg
d2lyZXMgbm8gY29ubmVjdG9yLg0KPg0KPiBTaG91bGQgdGhpcyBib2FyZC1zcGVjaWZpYyBkZXZp
Y2UgdHJlZSBleHBsaWNpdGx5IGRpc2FibGUgdGhlIHVudXNlZCBwb3J0LA0KPiBwZXJoYXBzIGJ5
IGFkZGluZyAmdXNiMSB7IHN0YXR1cyA9ICJkaXNhYmxlZCI7IH07ID8NCj4NClByb2JhYmx5IG5v
dC4=
