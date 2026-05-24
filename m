Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020127.outbound.protection.outlook.com [52.101.69.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C8A3A9D9F;
	Sun, 24 May 2026 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.127
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779642783; cv=fail; b=WW/Nxrpzb818tBDOTYYyLUoagM73RYHZXL7cApKiCPWqfUWp1hqnFDG3+xI7o0/beXQhVKk/D97SJv29MbX/eiqaiJDhi7Uuwkbc4rqoEdh+0VjmrZKqEBdk33TDEyyEhz8BFfYy/DQkXNz4p4qzEqx/gdVJIVF+VO2EucuXIL0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779642783; c=relaxed/simple;
	bh=W9cRtmks5DSkeshTcnfNXF5SrMvuqMh5SqW/UhwelSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tYHbsiJetTqu+3vwiqEAZ9vzy8rpVMui+q7op+Mt77aIga4xz8aicA2YFWGH/a0AyX4p1W+QnwoAkBBFkTMiMynF8up+rK0itt1e36OQKgbJIV2nRjApzbdb3NvhT5UP6yCgyRONV8e8lp1Wvr1f0sCVTWahR5uzskrxcQ5u1qk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WagpqQJy; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WagpqQJy; arc=fail smtp.client-ip=52.101.69.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WagpqQJy";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WagpqQJy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=Ju64xJQT8IgkePyS6jynXSNDt8QPeN/YeWq+nPGJF5QbGRUxBXLuCwdnnMata7HPkMBf9xElZUmGv4KVk+kfzm1TCoZRH3QAIZiHazq//wOOmeV6PDeTdUsheKDIMchVQz/eJ1dvCrr10wFUdeCRElOA0xC3aw8HVd02uJt0XboQ5bbnQFQkpmQs5jizy3qyg20og1EM95AWW22E27vheHLfAQX62rspP0ke7Lr38PDHXT2pv2l14VaZv04FMOLcN841tk6l6qeSvUDmZwjrR3OgAGEbW9+iEXjxvhFpRByQS7njvBORHgIcOaJ/6cOMV0y6CpZ/OD4Np7Gssp4rUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9cRtmks5DSkeshTcnfNXF5SrMvuqMh5SqW/UhwelSU=;
 b=PS8umWknziOAR8QSdWlXeT6dgAo2LPA1ET1xDFbn0TOjEXzyzdwQAXohbI3A+qIHE1RJMda/Xinsyu/vB30piv/f3Hk/5Zh94tCxV9jktjbrkfTD8hi+kmVSIXS2gaWGUMfV/mm2K75J4hHhlBw6g5aeKXk8L9aMYTvp576loJcDVI14UMs6Q1k7Ksvw6da533bkNb2BWZOyRbEv0gFV3tUBPpbBrUMuxN+dMk7QKqd7y4mp958mLk4YYyuKmlP7+KAdl29L+A+rz7nfeUtr6Ix9l/us7UKnoGpf97IGy2IgNZlENmQViJ9ntL5mBtoDytluAveNbjApHlQBa+p8Sg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9cRtmks5DSkeshTcnfNXF5SrMvuqMh5SqW/UhwelSU=;
 b=WagpqQJyRxIn6/4BYElGARv9YclVK8LVfOjULNjt/8mksqLkEnGi4eH+SqiPsIbqHkX1BMXZ8FhDmRCaoe4wLYps5MpbdT9Hor+it5YsdKrJuF/W4TEK6x1ccX+dNY33Mo2FwrFp7z1ZYV5AM9VyYjHhmMxVYcILx9F0VjFoKU5QpBaC+NzbE6zmbHVsiTNibh3VL6y/YZYO1aafeukAuMClKz0jGVZ5Agj9eVldSSWN/jA9J3UR1OMGuEQygdx3k9bDUdO+EWgutgsTlgZRsI1E5n5d6rEOJuNK8Mi8329dOz+SUHMkPmeka1JgRi080WtQzbOZG+tYwANPQwVBCg==
Received: from AS4P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::16)
 by AM9PR04MB8414.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Sun, 24 May
 2026 17:12:53 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::1b) by AS4P191CA0030.outlook.office365.com
 (2603:10a6:20b:5d9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.19 via Frontend Transport; Sun, 24
 May 2026 17:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Sun, 24 May 2026 17:12:53 +0000
Received: from emails-8778305-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-170.eu-west-1.compute.internal [10.20.5.170])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0E7FE7FD73;
	Sun, 24 May 2026 17:12:53 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 24 17:12:45 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWzbf1pwviQ9UkayjxVkPeNxJEvBSl0QzK61nwA4nfQ7/mpaY9YlawT7RSUv3NJU8NWwg2bhuClu9R2Nruvya88IulRXXV+AuLXpkK3yDUCjRNgz5rKimmW5WiJSYkiPVo5KxltLRu0lhO5r6KcuErQyP+OXYpd/w6H7ajQ/v7d6dQCgzDby32I1BkN3sudqfNwAXuLLiVGgIdnRHfFpd7bRuaO3skO+ll6XMd64Pmwk8cDAxMrBqOXd5qp4jhed0KbAFWMNX+N9lNcUk5HttZVSnirFcianCvLoMXgOzh300H+MvSDrwo4q5W9fkxNtof1MB9Yw+mhuflBWp/AnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9cRtmks5DSkeshTcnfNXF5SrMvuqMh5SqW/UhwelSU=;
 b=JeBQqiQjKAiY2WDilliJ9RgMONXh7mCE3D0j4w1Z1IaVVoPlDhBz4tOizFJiBHx13UJBBdHPd89doF2X9MH7Zq5ZnrwpClBp9rbiAYCm1f85Une17+o4PvUYJvlL5TdYQiccluABqat7405HKqQEkLhjR7QxwOTXSv2nY5VsZZTiuGypwk0qUq7RMHAwsORFS9kCVdOHeTOQzH8goJc6scxfnFJindjTnwgs7OOSzuKQwgQqHI/+97ajD2KtwM5bgXtg1nbdn9475JDmfycKpm2+DbZUsH1CjhLKnZa5J4rg+GNIyUzleRlaCOoQJz4hXroB50KGGbO/f4mmPsLjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9cRtmks5DSkeshTcnfNXF5SrMvuqMh5SqW/UhwelSU=;
 b=WagpqQJyRxIn6/4BYElGARv9YclVK8LVfOjULNjt/8mksqLkEnGi4eH+SqiPsIbqHkX1BMXZ8FhDmRCaoe4wLYps5MpbdT9Hor+it5YsdKrJuF/W4TEK6x1ccX+dNY33Mo2FwrFp7z1ZYV5AM9VyYjHhmMxVYcILx9F0VjFoKU5QpBaC+NzbE6zmbHVsiTNibh3VL6y/YZYO1aafeukAuMClKz0jGVZ5Agj9eVldSSWN/jA9J3UR1OMGuEQygdx3k9bDUdO+EWgutgsTlgZRsI1E5n5d6rEOJuNK8Mi8329dOz+SUHMkPmeka1JgRi080WtQzbOZG+tYwANPQwVBCg==
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com (2603:10a6:10:119::14)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Sun, 24 May
 2026 17:12:43 +0000
Received: from DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9]) by DB8PR04MB6859.eurprd04.prod.outlook.com
 ([fe80::65f7:a733:64c6:60f9%5]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 17:12:43 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
Thread-Topic: [PATCH v7 1/9] arm64: dts: lx2160a-rev2: extend 32-bit, and add
 64-bit pci regions
Thread-Index: AQHc641BrJq/RKSt4UOASflXt3DyN7YdSLuAgAAhOgA=
Date: Sun, 24 May 2026 17:12:43 +0000
Message-ID: <3528dc91-1ffc-42f9-94ea-a27c6c1d6a50@solid-run.com>
References: <20260524-lx2160-pci-v7-1-09370c23b952@solid-run.com>
 <20260524151347.BD92A1F000E9@smtp.kernel.org>
In-Reply-To: <20260524151347.BD92A1F000E9@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	DB8PR04MB6859:EE_|GVUPR04MB12217:EE_|AM3PEPF0000A792:EE_|AM9PR04MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: adbaad2b-b0fb-4631-e327-08deb9b7b119
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|4143699003|18002099003|22082099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 2JoP/C96fA9+tC88NOMb5meMMUlupOdeskVY3EmbSEMwFhFGUVBKJi5XxaTRsMbBq5kf9vSrFGidxivuYZoQyuBVRw+z9vxYRuoJs4HJL5qJ+RKmmVJ9oYp4utYnNfeZrpgu4i46788b2OydMvZuw8Ft7s4NztKYQ/3JYmdWVzJRGnkVxxYIome79AndOFzFPw10XK+zbfSnSEcfVCwnDkLP71kEtBaFcC/FxOd6fB9/+sj0ub26UWLc0DmAP+XqHgN3DJYRqZ9OtkK8g5SUGnl/rIg45Qe80ILO//ENHYMsioOL2UBi54UDixLPPyFGGf+whbBzvYMQfFBWDr69QNbniTrt08KzKsTlDAEOAXEOoLs7xE8WUGTFKdCNA+fk0l8F/bMd9ystFJLabFkHNPs6Eq7a0A8aXv0oUOcXmMbfy2YUI9SS2unoZUEmqY6e6PgHNKCBbvr5uZ602WWSO5SCbWX/a9lahvY4j8W86LMptT5agC9iP4LbCw6Fn3owIUVpweTpzm5SvCnP20Lh1HI6YyY9LtrXIFBQVpYn2LvUdjlMiaGGp0IW8e9QSFHM40IyfG+PYrAoushsytGTpwFOAR3gaqbp9MyCz7are5N+rP+7R+/yo4l724pePqaqPn32fiqQPd7qhELE+/Kdylgd1mxUH8yrlv5WqSUxPwfK0NnQVT+HPQiz2d9IXggEFUxYCTlXOE9Li1lRfN5MlmPaGXJvjU6XVJgJOsZk/5/clIoZFwTrNxmJKVmuAT9y
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6859.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(4143699003)(18002099003)(22082099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <71138A0DFF2C04478229DB3B35836BE1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 sWQfYY1kQU0qKjem1CFTFnNvKiprbnDPl45CTj2xepqXbO5KpMeuhfarl9x1BwF40q2RoAp6BLynmtml28lbbMrSkH/WvVtLeZ75uJ69m8sKcNbox5Sgba/uDPLEqi/8xNbi+TIBcpFiJsI83bTSF0Hrd6BlsSRWwsUWTJ/j1MyrRDN37imiXGjYeC7bS1o+7Frqz8kYwNNGI82FVlVi4PcuHjApywXwst/1/iirULpcSnWA9sBOKrC6dN5wmGroilZxwfu1GyiH9curk91uLwkOxFjm6MPfg6uP6wDW7wIgQWa3VLuef/BS3MVd/RDWzR12FAe9gQnRDtxtWHlKWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7d37915a147a4857981076db5a8820e9:solidrun,office365_emails,sent,inline:3aa50a055f7a8f03eeba3f3325423d72
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5dfbe4a-2be9-4f23-0117-08deb9b7ab58
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|14060799003|35042699022|4143699003|18002099003|56012099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ob3ksk61OG+jh89728LHRNcNuWYX5nCo+a9IQRo9HUB8LZMN5Fu5iGOaIdxKuFQqEharIhSdPkknc3TmeVsHLK6AOYxQCrJmyvMbom5X/H+SItCc1W0vxF9E1zyk59/cR2ZknLaemiOAGefUOGkclJOlEU3Ku9z2AhOyG9h7Po3dQ8l13hDYB8ccHod6BrXUFduov9FocE3PRP2hzFqjORJ65qjcjzLqhKptC7QIuepyaKK9dfGr0YYILv1Zkktg8OaWyHY9MnIR7VfKKODTW8HJP+Wo6gghomt+OCZnU4wmlHKvAuSXAL8oNUT6LjVn9qi91cZ5vQ5EHz8nXReE6sNp0zeh+/G1vfryId3UGBH9q6uCjcQ/jOcJ/MsSP62pFn+ngXGKM9+/ipE8MOfEW8xuFXPEYGzxnbqcHmyRXtNfdoK1I7i4xmOeGDyXX1FcBrlo5TGJex/UAt7C0ab9IkCAc4DfQQxnAfPTZpl1QuG7e1Y7xzEl3pFNwNcohbvz9HSGIuYRb5KJLx6CQrbdYpFlfZZcNMc/klhv8HohDgZlfN6Z+EqEx40eb6v4+4/MANV1E+eYsygpQNpNgNKJyjLl/CHLx4u31NPW4SO/NoDALoOQhy5j79/bdL32l0YyHhGm/R2CpJi6syEdIgqfR6L+wS0JFyVQlLaOhH0BVsCY314tf9o1LvZ/bv8xeYS4M2Bs20Ub8lr6XVwFSrYO0fXE0J7G6Oszdi/Vwu13jTE=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(14060799003)(35042699022)(4143699003)(18002099003)(56012099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lKUBqqwQY+ZXmK6S2BXMNDq2DaHUP3x411RyDSBmeAT3IYU6kGnVOUTr3GHl+piR5z/GyghbGxn10acUpAYkMXvWCucd4A4dAQBUvOhGQQzy/oOrtDuHHDcWITk8WOFJvVTVsYxL/3jytymoO41/SCYzbFIUX+uz9qJBWS4LPC3cyssX4wFLWZ2vbYbyNQsZE9LOG9GK0CIOQSJYKACO7Wno0hIQ76vX52iApmWJxJm2rG9eP7JExVyjAp4Gcqt1NZ2qC3ccduux2RqfXilmtks7hYpX11+f101dUcFcOlmaV7DTsUMGxF8DLcTfkjaECwF6eSjuxd3+LhKWrfRlskAeBYir1EyBm83dTg6se1KAokPj5H3ZTUQsUMK3HPZQyuQWd3OiMyw/4orf1FzTSJ6XP/mfG3L51s/4ORUUv56HQyjwdAyPYOHIoEl0FWUF
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 17:12:53.3807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adbaad2b-b0fb-4631-e327-08deb9b7b119
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8414

DQpBbSAyNC4wNS4yNiB1bSAxNzoxMyBzY2hyaWViIHNhc2hpa28tYm90QGtlcm5lbC5vcmc6DQo+
IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5k
IDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPiAtIFtIaWdoXSBFeHBhbmRpbmcg
dGhlIDMyLWJpdCBQQ0kgb3V0Ym91bmQgd2luZG93IHRvIDNHQiBjYXVzZXMgaXQgdG8gb3Zlcmxh
cCB3aXRoIHRoZSBpbmJvdW5kIHN5c3RlbSBtZW1vcnkgYWRkcmVzcyBzcGFjZSwgYnJlYWtpbmcg
RE1BLg0KPiAtIFtIaWdoXSBUaGUgaW50cm9kdWN0aW9uIG9mIHRoZSA2NC1iaXQgUENJIG1lbW9y
eSByYW5nZSBjYXVzZXMgZXhpc3RpbmcgVS1Cb290IGJvb3Rsb2FkZXJzIHRvIGZhaWwgZGV2aWNl
IHRyZWUgcGF0Y2hpbmcsIGJyZWFraW5nIE1TSSBhbmQgSU9NTVUuDQo+IC0tDQo+DQo+IGNvbW1p
dCBhODBlMmUzZjk3ODA4ZmRhZDc4MTI0MDQ2OWM1ZTA3ZTAxOTE5MWU5DQo+IEF1dGhvcjogSm9z
dWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+DQo+IGFybTY0OiBkdHM6IGx4MjE2MGEt
cmV2MjogZXh0ZW5kIDMyLWJpdCwgYW5kIGFkZCA2NC1iaXQgcGNpIHJlZ2lvbnMNCj4NCj4gVGhp
cyBjb21taXQgZXh0ZW5kcyB0aGUgMzItYml0IFBDSWUgbWVtb3J5IHJlZ2lvbnMgdG8gM0dCIGFu
ZCBhZGRzIDY0LWJpdA0KPiBQQ0llIG1lbW9yeSByZWdpb25zIGZvciBMWDIxNjBBIHJldjIuIFRo
aXMgYWxsb3dzIGFsbG9jYXRpb24gb2YgbGFyZ2UgQkFScw0KPiByZXF1ZXN0ZWQgYnkgZ3JhcGhp
Y3MgcHJvY2Vzc29ycyBvciBBSSBhY2NlbGVyYXRvcnMuDQo+DQo+PiBbNF0gcGNpIGJvb3Rsb2Fk
ZXJwIGF0Y2hpbmcgcmVsYXRlZCBlcnJvcnMgd2l0aCBJT1JFU09VUkNFX01FTV82NCBmbGFnOg0K
Pj4gWyAgICAwLjk2NzgwOV0gbGF5ZXJzY2FwZS1wY2llIDM4MDAwMDAucGNpZTogaG9zdCBicmlk
Z2UgL3NvYy9wY2llQDM4MDAwMDAgcmFuZ2VzOg0KPj4gWyAgICAwLjk2NzgzMF0gbGF5ZXJzY2Fw
ZS1wY2llIDM4MDAwMDAucGNpZTogICAgICBNRU0gMHhhNDAwMDAwMDAwLi4weGE3ZmZmZmZmZmYg
LT4gMHhhNDAwMDAwMDAwDQo+PiBbICAgIDAuOTY3ODQyXSBsYXllcnNjYXBlLXBjaWUgMzgwMDAw
MC5wY2llOiAgICAgIE1FTSAweGEwNDAwMDAwMDAuLjB4YTBmZmZmZmZmZiAtPiAweDAwNDAwMDAw
MDANCj4+IFsgICAgMC45Njc4NDldIGxheWVyc2NhcGUtcGNpZSAzODAwMDAwLnBjaWU6ICAgICAg
IElPIDB4YTAwMDAxMDAwMC4uMHhhMDAwMDFmZmZmIC0+IDB4MDAwMDAwMDAwMA0KPj4gWyAgICAx
LjE2OTMxNV0gcGNpIDAwMDA6MDE6MDAuMDogWzgwODY6MTU3Ml0gdHlwZSAwMCBjbGFzcyAweDAy
MDAwMCBQQ0llIEVuZHBvaW50DQo+PiBbICAgIDEuMTY5NzMzXSBwY2kgMDAwMDowMTowMC4wOiBC
QVIgMCBbbWVtIDB4MDAwMDAwMDAtMHgwMGZmZmZmZiA2NGJpdCBwcmVmXQ0KPj4gWyAgICAxLjE2
OTc3MV0gcGNpIDAwMDA6MDE6MDAuMDogQkFSIDMgW21lbSAweDAwMDAwMDAwLTB4MDAwMDdmZmYg
NjRiaXQgcHJlZl0NCj4+IFsgICAgMS4xNjk3OTZdIHBjaSAwMDAwOjAxOjAwLjA6IFJPTSBbbWVt
IDB4MDAwMDAwMDAtMHgwMDA3ZmZmZiBwcmVmXQ0KPj4gWyAgICAxLjE3MzM4OV0gT0Y6IC9zb2Mv
cGNpZUAzODAwMDAwOiBubyBtc2ktbWFwIHRyYW5zbGF0aW9uIGZvciBpZCAweDEwMCBvbiAobnVs
bCkNCj4+IFsgICAgMS4xNzM1MTVdIE9GOiAvc29jL3BjaWVAMzgwMDAwMDogbm8gaW9tbXUtbWFw
IHRyYW5zbGF0aW9uIGZvciBpZCAweDEwMCBvbiAobnVsbCkNCj4gW1NldmVyaXR5OiBIaWdoXQ0K
PiBEb2VzIGFkZGluZyB0aGUgNjQtYml0IFBDSSBtZW1vcnkgcmFuZ2UgY2F1c2UgZXhpc3Rpbmcg
VS1Cb290IGJvb3Rsb2FkZXJzIHRvDQo+IGZhaWwgZGV2aWNlIHRyZWUgcGF0Y2hpbmc/DQo+DQo+
IFdoZW4gVS1Cb290IGVuY291bnRlcnMgdGhlIDY0LWJpdCByYW5nZSwgaXQgYXBwZWFycyBmZHRf
Zml4dXBfcGNpZSgpIGFib3J0cw0KPiBhbmQgZmFpbHMgdG8gYXBwZW5kIHRoZSBtc2ktbWFwIGFu
ZCBpb21tdS1tYXAgcHJvcGVydGllcy4NCj4NCj4gV2l0aG91dCBpb21tdS1tYXAsIHRoZSBrZXJu
ZWwgd2lsbCBub3QgYXR0YWNoIHRoZSBTTU1VIHRvIHRoZSBQQ0llIGRldmljZXMuDQo+IFdpdGhv
dXQgbXNpLW1hcCwgdGhlIGtlcm5lbCBjYW5ub3QgdHJhbnNsYXRlIFBDSWUgUmVxdWVzdGVyIElE
cyB0byBJVFMNCj4gRGV2aWNlIElEcywgd2hpY2ggYnJlYWtzIE1TSS9NU0ktWCBhbGxvY2F0aW9u
cy4NCj4NCj4gQ291bGQgdGhpcyBwcmV2ZW50IGRldmljZXMgbGlrZSBOVk1lIGRyaXZlcyBmcm9t
IGluaXRpYWxpemluZyBhbmQgYnJlYWsNCj4gY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIGRl
cGxveWVkIGJvb3Rsb2FkZXJzPw0KVGhpcyB3YXMgYSBzdHJheSBlcnJvciBmcm9tIHByZXZpb3Vz
IHZlcnNpb24gYW5kIHdhcyByZXNvbHZlZCBieSBwYXNzaW5nDQpjb3JyZWN0IGZsYWdzLCBhcyBw
cmVzZW50IGluIHY3Lg0KPg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2ZzbC1seDIxNjBhLXJldjIuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2ZzbC1seDIxNjBhLXJldjIuZHRzaQ0KPj4gaW5kZXggZjU0MDA1ZTM3OTI0Yi4uZGIxZWJl
ZTUzZjZmMCAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2Zz
bC1seDIxNjBhLXJldjIuZHRzaQ0KPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvZnNsLWx4MjE2MGEtcmV2Mi5kdHNpDQo+PiBAQCAtMTQsOCArMTQsOSBAQCAmcGNpZTEgew0K
Pj4gIAkgICAgICAweDgwIDB4MDAwMDAwMDAgMHgwIDB4MDAwMDIwMDA+OyAvKiBjb25maWd1cmF0
aW9uIHNwYWNlICovDQo+PiAgCXJlZy1uYW1lcyA9ICJyZWdzIiwgImNvbmZpZyI7DQo+PiAgDQo+
PiAtCXJhbmdlcyA9IDwweDgxMDAwMDAwIDB4MCAweDAwMDAwMDAwIDB4ODAgMHgwMDAxMDAwMCAw
eDAgMHgwMDAxMDAwMA0KPj4gLQkJICAweDgyMDAwMDAwIDB4MCAweDQwMDAwMDAwIDB4ODAgMHg0
MDAwMDAwMCAweDAgMHg0MDAwMDAwMD47DQo+PiArCXJhbmdlcyA9IDwweDgxMDAwMDAwIDB4MDAg
MHgwMDAwMDAwMCAweDgwIDB4MDAwMTAwMDAgMHgwMCAweDAwMDEwMDAwPiwgLyogMTYtQml0IElP
IFdpbmRvdyAqLw0KPj4gKwkJIDwweDgyMDAwMDAwIDB4MDAgMHg0MDAwMDAwMCAweDgwIDB4NDAw
MDAwMDAgMHgwMCAweGMwMDAwMDAwPiwgLyogMzItQml0IC0gbm9uLXByZWZldGNoYWJsZSAqLw0K
Pj4gKwkJIDwweEMzMDAwMDAwIDB4ODQgMHgwMDAwMDAwMCAweDg0IDB4MDAwMDAwMDAgMHgwNCAw
eDAwMDAwMDAwPjsgLyogNjQtQml0IC0gcHJlZmV0Y2hhYmxlIC0gMTZHQiAqLw0KPiBbU2V2ZXJp
dHk6IEhpZ2hdDQo+IERvZXMgZXhwYW5kaW5nIHRoZSAzMi1iaXQgUENJIG91dGJvdW5kIHdpbmRv
dyB0byAzR0IgKDB4YzAwMDAwMDApIGNhdXNlIGl0IHRvDQo+IG92ZXJsYXAgd2l0aCBpbmJvdW5k
IHN5c3RlbSBtZW1vcnk/DQo+DQo+IFN5c3RlbSBtZW1vcnkgc3RhcnRzIGF0IHBoeXNpY2FsIGFk
ZHJlc3MgMHg4MDAwMDAwMC4gU2luY2UgdGhlcmUgaXNuJ3QgYQ0KPiBkbWEtcmFuZ2VzIHByb3Bl
cnR5IG1hcHBpbmcgaW5ib3VuZCBETUEgdG8gYSBkaWZmZXJlbnQgYnVzIGFkZHJlc3MsIHN5c3Rl
bQ0KPiBtZW1vcnkgdXNlcyBhIDE6MSBtYXBwaW5nLCBtZWFuaW5nIGluYm91bmQgRE1BIHRhcmdl
dHMgMHg4MDAwMDAwMCBhbmQgYWJvdmUuDQo+DQo+IElmIGEgUENJZSBkZXZpY2UgcmVxdWVzdHMg
YSBsYXJnZSAzMi1iaXQgQkFSLCB0aGUga2VybmVsIG1pZ2h0IGFsbG9jYXRlIGl0DQo+IHdpdGhp
biB0aGlzIDB4NDAwMDAwMDAtMHhmZmZmZmZmZiByYW5nZS4gVGhpcyBjYXVzZXMgdGhlIFJvb3Qg
UG9ydCdzDQo+IGRvd25zdHJlYW0gYnJpZGdlIE1lbW9yeSBMaW1pdCByZWdpc3RlciB0byBiZSBw
cm9ncmFtbWVkIHRvIGEgdmFsdWUgPj0NCj4gMHg4MDAwMDAwMC4NCj4NCj4gQSBSb290IFBvcnQg
d29uJ3QgZm9yd2FyZCB1cHN0cmVhbSBtZW1vcnkgdHJhbnNhY3Rpb25zIGlmIHRoZSBhZGRyZXNz
IGZhbGxzDQo+IHdpdGhpbiBpdHMgcHJvZ3JhbW1lZCBkb3duc3RyZWFtIHdpbmRvdywgYXMgaXQg
YXNzdW1lcyBpdCBpcyBwZWVyLXRvLXBlZXINCj4gdHJhZmZpYy4NCj4NCj4gQ291bGQgdGhpcyBp
bnRlcmNlcHQgZW5kcG9pbnQgRE1BIHRhcmdldGluZyBzeXN0ZW0gbWVtb3J5IGluIHRoZSBvdmVy
bGFwcGVkDQo+IHJhbmdlIGFuZCBjYXVzZSBzeXN0ZW0gaGFuZ3M/DQpUaGlzIGNvbmZpZ3VyYXRp
b24gd2FzIHRlc3RlZCB3aXRoIE5WTWUgYW5kIEdQVXMsDQp0aGUgU01NVSBzaG91bGQgZW5zdXJl
IGlzb2xhdGlvbiBwY2kgYnVzIGFkZHJlc3NlcyBkbyBub3Qgb3ZlcmxhcCB3aXRoDQpwaHlzaWNh
bCByYW0gYmFzZSBhZGRyZXNzLg==
