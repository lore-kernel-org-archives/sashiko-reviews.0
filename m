Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021101.outbound.protection.outlook.com [52.101.70.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D34973AA
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.101
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611403; cv=fail; b=gotmOrdIOARw7A+069j/yrgAFLZ5yMYRzanTaohi5lM46b5eTiIDyJ0fD7/4yUqjY4bx8cfYLJESDmtWAYeGx6AHdKaA0GUQpmye7VgRWeKKBhrLi/pFXRNwUOSGFENeVNC+oWdvbnYnJIQ8KeAnQFF02sV6Ysut1k9RqA3vgYo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611403; c=relaxed/simple;
	bh=PTMpyq0hUbvKqYTiURUZTrNQdZRHyA6ViYbZCBELmpU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vDHxyuTsB2D/ttsghvjc8TxFzrbQu3KCzYvIQysOIE3EjKuZFcdBQ3368yWN4MuZmkGsVEcyKJ4UNTsljk/5NVWJTBWYLv1pGQ+vKh6U2Z7oJapImpL3BbFipnYSPwSdXCT3Cl5rJv6we9cX24JPMwwCIgYAYJiUeyo/76q26hE=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=BZegl6QW; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=BZegl6QW; arc=fail smtp.client-ip=52.101.70.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="BZegl6QW";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="BZegl6QW"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H5isC7a0N2QqSL98dAbIqSOyBwKAwa4r6Gk5ryA4W8izoWQ6IH3CNAAmsdRlA/OLKpnQIdKlt+irPBn40MDC5O3kIETlqh6mWm0p5cWBGcqDT6UngmrR29KoPoRXm4vKfH0bGQj9bFBM1OTSk6QIgQaN+q30f0jKCRKeSBEcSwZhwnLhV5Yr3LA8CNBJcTJkM9ZCaFkmTrg5pEU/D4H4Wf5LhgcidogUi+/7PZ6wBHVnqXB8W7JNFEdwVC8gnLGcM+lwa7D8agMvJAfPUeKEuNh3Wec18HMZwY9/aVZOLsbTlFoIBObgDjVE4sntiyR84rtiAOOnYRFHpQWktvSQuA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTMpyq0hUbvKqYTiURUZTrNQdZRHyA6ViYbZCBELmpU=;
 b=CeUci1L8+zBhhZOjq2W8WNCMorP2bigmUo98lxwyisnJfqPAv1g8qWOK+nw1agOgNa2KxYMlyzcLKH13iIcUeMO6QVhzmiJwl7Qg7mBUKHL4lgIr/IiK+zeJgo2N40i9fvPPPwbzAfemJ6XdUPzqeRPZkCkbFkrxTxpl7XMXTfDsIrXLevOcI7Vmor20TxT4tsbVI1Is1yqC0EcHfibbeb960NAKl3WqV6cFFNVTxy3U7lq4NZ3Nvm0cahWg0CmM1WYH/ixAjPc9s40pGx3ACBvBxe6kjPDvbLD+R8snZw+x3JMRVWo977slO+PuabobG7TaLYJ3SWCLngwQUgSgkw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,2,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTMpyq0hUbvKqYTiURUZTrNQdZRHyA6ViYbZCBELmpU=;
 b=BZegl6QWRuEKNrdDCSrKHSJgxjURH5WsUUumeXYmT07SaaNy086q+n+bknC4roFk8jfoSW1zBCd39vZAd07e9gNYgCFTKkgsCTQdxm2/BqQ4ncdnJT/NBd6DC/FljDlwZiqgRkAuGmuwtoSNRg6jMspS5LiNXrLwrKdRfiEm5weS9oTHqH4xjwr5gOR2dxFXJ7Gauvd4QMYhdjLA+6Dcacn0duUWkjrx6o6/T5BJH0Fm+JTrSQd+babL1/j4QewniatWQbYsvZMJ3Jc4AnHfvrqxSX6OHNHH1O55RBCDSNoeiL3aMGEpS8S3ND1ZskSQ7W+66niNE9ccDYI57sNPOA==
Received: from DU2PR04CA0290.eurprd04.prod.outlook.com (2603:10a6:10:28c::25)
 by AM9PR04MB8972.eurprd04.prod.outlook.com (2603:10a6:20b:40b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 16:03:15 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::70) by DU2PR04CA0290.outlook.office365.com
 (2603:10a6:10:28c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 16:03:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 52.17.62.50) smtp.mailfrom=solid-run.com; dkim=pass (signature was
 verified) header.d=solid-run.com;dmarc=pass action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 16:03:15 +0000
Received: from emails-8864373-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-37.eu-west-1.compute.internal [10.20.5.37])
	by mta-outgoing-dlp-272-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8F38D7E942;
	Mon, 28 Sep 2026 16:03:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1790611395;
 b=pJy5Y9ta0dtxfYkmRnhrmgUSU2AOvdakt1Ic81C2NS4eoTAupwg31k27ETSVuNlrD7kUW
 NTGjr0A3TkIuf9npQR0mW8UUk5RM79rKLBNIskxnga15gcfkBnWyGF5fUa7nDxyumHabxcW
 f+73yb/3TryeCWV6uiJ2i6DD/L2Dz9U=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1790611395; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=PTMpyq0hUbvKqYTiURUZTrNQdZRHyA6ViYbZCBELmpU=;
 b=TmHecKCX5tx1vtVz6hCH/HBKrTzsYcWwBHnVl3Bry1INOFe4pbdbNzvVMOa0GLjhwJYp+
 Vor3tZka7Uz0AYmPJFks+N0WK/Q8qVos9YthPX5wvbWV8jgXn3M41iSbZ9FlW8oTQXIVtb1
 VDD4NB199VuGAl50Fvxl+MJtEpU/2C4=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=pass header.d=solid-run.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTMpyq0hUbvKqYTiURUZTrNQdZRHyA6ViYbZCBELmpU=;
 b=BZegl6QWRuEKNrdDCSrKHSJgxjURH5WsUUumeXYmT07SaaNy086q+n+bknC4roFk8jfoSW1zBCd39vZAd07e9gNYgCFTKkgsCTQdxm2/BqQ4ncdnJT/NBd6DC/FljDlwZiqgRkAuGmuwtoSNRg6jMspS5LiNXrLwrKdRfiEm5weS9oTHqH4xjwr5gOR2dxFXJ7Gauvd4QMYhdjLA+6Dcacn0duUWkjrx6o6/T5BJH0Fm+JTrSQd+babL1/j4QewniatWQbYsvZMJ3Jc4AnHfvrqxSX6OHNHH1O55RBCDSNoeiL3aMGEpS8S3ND1ZskSQ7W+66niNE9ccDYI57sNPOA==
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com (2603:10a6:190:28::8)
 by GVXPR04MB10183.eurprd04.prod.outlook.com (2603:10a6:150:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:03:05 +0000
Received: from MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292]) by MMZPR04MB400504.eurprd04.prod.outlook.com
 ([fe80::2f52:2d22:c7b3:4292%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:03:05 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: Re: [PATCH v9 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Thread-Topic: [PATCH v9 06/11] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Thread-Index: AQHdT1c5+rTxvAvUYE6tzT9eGwPYzLbkFE4AgAAStIA=
Date: Mon, 28 Sep 2026 16:03:05 +0000
Message-ID: <e50a76af-479d-4cdb-8d74-4e93c265b243@solid-run.com>
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-6-5901e0fc9e44@solid-run.com>
 <20260928145609.96DF71F000FF@smtp.kernel.org>
In-Reply-To: <20260928145609.96DF71F000FF@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	MMZPR04MB400504:EE_|GVXPR04MB10183:EE_|DB1PEPF000509F9:EE_|AM9PR04MB8972:EE_
X-MS-Office365-Filtering-Correlation-Id: faa075e7-0434-42de-a195-08df1d7a0174
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|10070799003|376014|1800799024|366016|10067099003|3023799007|6133799003|22082099003|18002099003|56012099006|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 WzmbNOIE4GGy3Z7ezUXFDqw2dmgv6SmlLpBaWiuYD6fiLaKmOVMAbIkTxBDpkA7ag6Qvxbq7pQgrw85rDPXua9LmL0Yr4wr0F05JijJAGX6W5bySiBEnuVqJgaOSvRigycv8eqZKNDYBnViAdjFc00VFDv4nH9/QWZTYZ0lhFQ/BC/f5uiMwqYSAV3O55Mvl7v7q2hfK2kbKrC9nrC+UatK+tqFCrTE94TFBn+uQ1n2R4vHtAjqkMHojSWOie4A2j+8EfJYJz4SA1+B22TyYzzDG9OYQlgiidWZXKtO1nYljt1sNVEIDbSOXCxfeD6YJo9Ma0tGQmqLqgc+JzKgmdOZRSZ9EaQ0mVPWDPS+PSJktbqqzraqnfQJAStnVL4FxGwD8ikXYxnnXvTSH2t0VGWDMw9sPvE5RA42cvWBwSxMjTVd0ooW4/3H81IJyeA6qHJTupmdHf5ZajS5/BFoa2jYea5acWgX2tq7Gel91neTOhvh7mBGhY/aziUtleKb3A32O7sd/TwuVGtJBpwYOZAfRPgjktPsIDTZvcnOedYWLDwc1h0WOvFgcIkIfsZD0ytUS3wG/ERZXJqUZ5a1eOVZsPqqWQt3pDLKBiL18QlhyZPLruas7tSjk1YlyCauBO/2pfNCczc2Nb1SWTtLk3tZOjDGVYrk2HG8SNqLK7uQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR04MB400504.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(1800799024)(366016)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <541874341D4A28499D1FBD9ADB74301D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 RrrjyVpkDQw0t9ADCyffVclqMnkVhlgVfhLUGUGjZceGoqBU67i9RM7UBAtzhEscC5vlYLH/lYvozyyg0iT2JKzJaRZt6s0rZuTf5cwYnNf24J64b9UP/9zuFGpD+NElAyD6LI+bhSnOXjTrTag/bqpBwyO6CFTR91EYBvlWjUHjrzna+aJcd1Xbpc77dvjB1/WDLsBYuUBm9m6yKeAcE+lmKUDyaXRBV3pCMmk2ase8tUTqe1SSon6D8RhfP6hHPKHv9n3ZtyCkSPSQu//Fv4jnKf2zwQ2ZG661pSKxleQJybuMYJdJ28kJXqHy9OPDy8dWI42p/WMATYx6YayLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10183
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 43dc70b4a3ac4ee69017fd37b71b0ced:solidrun,office365_emails,sent,inline:68921a3bab0a7bf15cd07fc0a82db95d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNcMdMk1phwHwoH1v/r7FyKQJ7yR0rDX5/AOWBCCZ9Jl95htXy2pGwC97mS28wLSP21itFVmc8rBVl7G0dC21lPOJoVM9UtULHLFd7nAb+5yUkuO4cEyTwCJcL9qXxkW5rhzCPn9dGubgi+D6nbA2h8Axei6lQAcRvRaeVN6ERMYK94PpL4ygpO7aj1SY5/nxjGDnY6u1Io+oQRTlr2ga8KYOjNWoiTchGoOuVzrlFv5Th3z2ZqarL/2ZAwAFI0hMHdrQKpGPMbYopzDZ2x7fx+XXfqM8eYDunsaSYs5b6zbv6VWxBl4BSJbvpljMcGtgfp7LxdJoEvYW81MwUaT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTMpyq0hUbvKqYTiURUZTrNQdZRHyA6ViYbZCBELmpU=;
 b=NNR5eyypoqC662sQMgU4Gbv6oML88of3EMuBAmqm0f89SYfqa2o9WK8yNCoRARcou5QRMXz+0Ly56PJG8PuYY1494Ivj5zvLu8ZQgGPDlVpu9subOOSE/nKXP3BcFlxGaC3mc3JiCOIoNhaXCFdCCrPZ9SVWJ+mq/US/Ew8SZcP1xXsVMNjAn9HChH31sJ4hEv02jRN+SkCHmEY4SsaLkseOQIUy7l01fsqsCsOAhkCSGbUM2UXrGEWAMT+eqF9BvapizdP3JnZDPWaDXy7jtMpZlF+FYLSbCywKWQ4siHYyEnmLnPJjSBh5BVdmwUHeqLyenrVeuy5Q7kFNWKiP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=pass header.d=solid-run.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf6fa64f-f4a5-4418-eff7-08df1d79fb6e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|35042699022|376014|14060799003|13003099007|4143699003|56012099006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	VV4yq1Hm2MzGo1pwwMZe57MrtoCxtc4CBBjBAByp+laL6g3ccdk7ldb3k5K7DwEkI8PMGIDRwng3pDD1dxnvlkI1TOO2/NK95zPDS5TaIjhANDvKi6JO+JoOLcaayOJNv+FcZtT+nOgJfgWkjYUVnKSRRmCYoYB9tKCFRB7p8HY5HKAsChJLNltBcEBXNERQCeigbdnkn1qtdKJya9f5Tn2QyMQltzxQP/uFJMKVVQUywRLV2bZPbkng+kbr4rmfpPTKF4P5B58a21tpDF89iAVbjJgMJqYnxOQInz96gxFHN/CYllmWYc51iq5sCga9T0CUnaZ7RExss5QtB/scOiAMTDj/+DV2RT8amG+xOU+fjNHK7YJJvTR2tTWeZWeUAdMTrpETkg8GoEcu21eK2KhF2XZVC9ccnhKz1M0zkWJL4D7lmLMnXFdtjlKkJ/0tiIHOXzdZCfH6GAfW1pOxWOzBICbocPtr0sZjbtLLXcuwrMfnd0WftVD3wm9eYYYObTfLO4Hmn3PxkfMaqiWhSTR+R1/VZ8Ko0n1FN1VBY9/nLcawdRFI8eXQHrxQRz1OFhGw/68u5UjIqYr/mFpHe3nUSzei2UKFY2l9Y6MRq9620J5lLRO3WVzffrhF97/MZEpo09WQb5zz71nbc1a3pQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(35042699022)(376014)(14060799003)(13003099007)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4TfE9RbUFcjsIZWFDwYwQzoDuRiSsXyaWOVAw+BTGNgvZWHjXClb6C58yQBV7KiBja2zdwmeFHwDlRk3ZZTrBEM3qT3qghvgbDsQhgjH2L80aL9bgMru1edDun440/U5VENk5EI8rKK+KbEjrIKtDEHTfrGc3QZ6+LwwbWAwJ/3xDmGQsOGY6rK46eDDZAymrIfSR5mdnw4qmYNRete+CEWLhk/EoWdduDhbZ3DXasq/YC9v9dMFnB584uMC95ueb9K2A4Nl06vPQncaFih3FZ/yDeO4ruy9/JPGHjyeZsTK5HghbMhk+9oftrsHVwwumJDZfkxDV40I5d4pZaDx+xvpbum7OyvvIddocNQUjv9sZR6xHFFNQohoZ3F3Zk9LJlIRZLWCvnh3cqBELVnL+RjiE+R5u52pM7PxDyPjfsJZL4wPBQBVcEOC6yc5HD23
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:03:15.7092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa075e7-0434-42de-a195-08df1d7a0174
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8972

QW0gMjguMDkuMjYgdW0gMTY6NTYgc2NocmllYiBzYXNoaWtvLWJvdEBrZXJuZWwub3JnOg0KPiBU
aGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAx
IHBvdGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gZHRzOiBtaXNzaW5n
IG91dHB1dC1lbmFibGUgcHJvcGVydHkgZm9yIEVUMF9UWEMgcGluDQo+IC0tDQo+DQo+IGNvbW1p
dCBmN2QxODM2ZWYyY2E5ZDQ3YmE0MmU5MmZjZjdiODE1NWRlYWM5OTlhDQo+IEF1dGhvcjogSm9z
dWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+DQo+IGFybTY0OiBkdHM6IHJlbmVzYXM6
IGFkZCBzdXBwb3J0IGZvciBzb2xpZHJ1biByemcybGMgc29tIGFuZCBoYi1paW90IGV2Yg0KPg0K
PiBBZGRzIGRldmljZSB0cmVlIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1biBSWi9HMkxDIFNvTSBv
biB0aGUgSHVtbWluZ0JvYXJkDQo+IElJb1QgY2FycmllciBib2FyZC4gVGhlIFNvTSBmZWF0dXJl
cyBFdGhlcm5ldCwgZU1NQywgRERSLCBhbmQgV2lGaS9CVCwNCj4gd2hpbGUgdGhlIGNhcnJpZXIg
cHJvdmlkZXMgYWRkaXRpb25hbCBJL08gbGlrZSBVU0IsIFJTMjMyL1JTNDg1LCBhbmQgRFNJLg0K
PiBEZXNjcmlwdGlvbnMgZm9yIGVNTUMsIG1pY3JvU0QsIGFuZCBSUzQ4NSBhcmUgc2hhcmVkIHdp
dGggdGhlIEcyTCB2YXJpYW50Lg0KPg0KPiBbMV0gaHR0cHM6Ly93d3cuc29saWQtcnVuLmNvbS9l
bWJlZGRlZC1pbmR1c3RyaWFsLWlvdC9yZW5lc2FzLXJ6LWZhbWlseS9yei1nMmxjLXNvbS8NCj4g
WzJdIGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5jb20vZW1iZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVu
ZXNhcy1yei1mYW1pbHkvaHVtbWluZ2JvYXJkLXJ6LXNlcmllcy1zYmNzL2h1bW1pbmdib2FyZC1y
ei1nMmwtaW90LXNiYy8NCj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcnpnMmxjLXNyLXNvbS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6
ZzJsYy1zci1zb20uZHRzaQ0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IC0tLSAvZGV2L251
bGwNCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc3Itc29tLmR0
c2kNCj4gWyAuLi4gXQ0KPg0KPj4gKyZwaW5jdHJsIHsNCj4+ICsJZXRoMF9waW5zOiBldGgwIHsN
Cj4+ICsJCXBpbm11eCA9IDxSWkcyTF9QT1JUX1BJTk1VWCgyOCwgMSwgMSk+LCAvKiBFVDBfTElO
S1NUQSAqLw0KPj4gKwkJCSA8UlpHMkxfUE9SVF9QSU5NVVgoMjcsIDEsIDEpPiwgLyogRVQwX01E
QyAqLw0KPj4gKwkJCSA8UlpHMkxfUE9SVF9QSU5NVVgoMjgsIDAsIDEpPiwgLyogRVQwX01ESU8g
Ki8NCj4+ICsJCQkgPFJaRzJMX1BPUlRfUElOTVVYKDIwLCAwLCAxKT4sIC8qIEVUMF9UWEMgKi8N
Cj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBEb2VzIHRoaXMgY29uZmlndXJhdGlvbiBvbWl0IHRoZSBv
dXRwdXQtZW5hYmxlIHByb3BlcnR5IG5lZWRlZCB0byBkcml2ZSB0aGUNCj4gRXRoZXJuZXQgTUFD
LXRvLVBIWSBUWCBjbG9jaz8NCj4NCj4gVGhlIGV0aDBfcGlucyBub2RlIGx1bXBzIGFsbCBFdGhl
cm5ldCBwaW5zIGludG8gYSBzaW5nbGUgcGlubXV4IHdpdGhvdXQNCj4gZGVjbGFyaW5nIG91dHB1
dC1lbmFibGUuIFdoZW4gdGhlIHBpbmN0cmwgZHJpdmVyIHByb2Nlc3NlcyB0aGlzLCBpdCBsZWF2
ZXMNCj4gdGhlIFBJTl9DRkdfT0VOIGJpdCBkaXNhYmxlZCwgbWVhbmluZyB0aGUgUEhZIHdpbGwg
bm90IHJlY2VpdmUgYSB0cmFuc21pdA0KPiBjbG9jayBhbmQgRXRoZXJuZXQgdHJhbnNtaXNzaW9u
IGNvdWxkIGZhaWwuDQo+DQo+IFdvdWxkIGl0IGJlIGJldHRlciB0byBpc29sYXRlIEVUMF9UWEMg
aW50byBhIHN1Ym5vZGUgd2l0aCBvdXRwdXQtZW5hYmxlDQo+IGRlY2xhcmVkIHRvIGVuc3VyZSB0
aGUgY2xvY2sgaXMgZHJpdmVuIG91dCBieSB0aGUgU29DPw0KPg0KPj4gKwkJCSA8UlpHMkxfUE9S
VF9QSU5NVVgoMjAsIDEsIDEpPiwgLyogRVQwX1RYX0NUTCAqLw0KPj4gKwkJCSA8UlpHMkxfUE9S
VF9QSU5NVVgoMjAsIDIsIDEpPiwgLyogRVQwX1RYRDAgKi8NCj4gWyAuLi4gXQ0KPg0KVGhpcyBp
cyBhIGZhbHNlIHBvc2l0aXZlIGluIHRoYXQgaXQgaXMgdW5jb21tb24gdG8gc2V0IG91dHB1dC1l
bmFibGUgb24NClJaL0cyIHBsYXRmb3JtcywgaXQgaXMgYSBkZWZhdWx0IGF0IGJvb3QtdGltZS4N
Cg0KTExNIHBhdHRlcm4tbWF0Y2hpbmcgd2FzIGxpa2VseSBmZWQgZnJvbSBwYXRjaCAyIGluIHRo
aXMgc2VyaWVzLA0Kd2hpY2ggYWRkcyBvdXRwdXQtZGlzYWJsZSBhbmQgaW5wdXQtZGlzYWJsZSB0
byBhbGxvd2VkIHByb3BlcnRpZXN8DQpmb3IgdGhlIHBpbmNvbnRyb2xsZXIuDQoNCg==
