Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011017.outbound.protection.outlook.com [40.107.130.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DE337F8D6;
	Wed, 26 Aug 2026 05:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787723619; cv=fail; b=GKMeUap7u7qdMrjhJzcSDrEUS0grCcQaqvp+BXl27KHZNeaPNznSFwAq7sC+dOT9miuOEv0aShasmX6XbCpMynVLHceEZ7arJtyqVUvdwlQYhq6G3kR5/HxV4ijmvbUfO7J/8PzBoun2NkNN3IGc0DMYxzdDSLAB4rNvPeSaAec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787723619; c=relaxed/simple;
	bh=3DbEzP79cMmwjP1G1QC4YzrKKeRXh7u1cJE1u2yp+sI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GzdhBsPqgbKZjiu4+qZMm3GP9I1Mu1K6MUEPlSKgOzaTb+KY6pD5ZCstegSf/eHryRK8PKcWbDrfTiqzUVemXDpLk3bS2D02LLDpq/7iwHJgwCNFA9LbCWhv/13Y11F2rbSvwQh830jlhU8hOquGIidvhmP5xG66ITY+pngIYAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xHx0ktJK; arc=fail smtp.client-ip=40.107.130.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xHx0ktJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FakbUNfrfN/WFS6C0Otwyf3y+PpfvKFdUwFFuSahSJxWG/dCJIm8FQhWKakLGJQNgXStyrh+h7mNtYfCL2HhcauMK2bRGEeEZLQyx0eh3M+xtKMc3jaRyYT/AxJIfu+4hH9kNNiAL9EJWayU09BR9uZHpUXRh0vNqnE+O5UpCUQdTZBSEWWK6vBQ12QRVfpMDKHeIdKiGGqFaIVPWx31jwSSELOnOW6ssa1CFk9PFUWSEX74XtuKpip4uhC7j8godS159cNTHT/zXsvpKArufO6mcoLbwE9yu9PhIsyr4QKfExZT0W+HFke46w5d6ezdLmMSeRY+9Dh//fM5VPaHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DbEzP79cMmwjP1G1QC4YzrKKeRXh7u1cJE1u2yp+sI=;
 b=dvrASTc2zI4PV806+l5nh2V76q7BQ7nLZ/Mk/E5taK8rkDcn0ld7o6EO9pgAYW+XdjH2KF+mMY1aqcGjnFRDNDsgI7pi08XArg/FBrRemZsYcg6l8CqOJmkmJdtBEcSWXtEd3Sez30odUo24FPJYP5WtfdL6ll0eGdtwrIiS2G+nuInuaKXxTlASb/i5S7AodHwMTfcPjpa07b3DyEA0hMPJIW7YhQjM0nRZHvUBJh+pTxdt9kGXl7Zev8BdI0SSdnVrIdFLv+DdOK3XnF/BYeib8d4StJtvYJRNG6aQlMazN/g/Ozfe16QjgfSjXUShFScwa84dYfotqWAuPMnLng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DbEzP79cMmwjP1G1QC4YzrKKeRXh7u1cJE1u2yp+sI=;
 b=xHx0ktJKOnNJcx43JjKszVpn+8aSA2Sy6XsSUYpketYzWsesD8NbLQp3mx5THgeak7LGcDym9qsBQqaGc/lsRt6cjTfQoHrr6SzFqYMDGtmzMRE9DOouQYQSk67bz/2hCNjQf/renmuedLseq7xBDl0FWQesbdcRUf3tCR/n0JvEaScXgYSAT/DyuwzkAKRXjGfq9Ajs2vKr8bX9rpELMKMAskersi45jILDkfdbrlNabqg5IKDSCdn7OVX5FteavSxoi79dB9MFGF1VtfDtFTaBznLJn4IdMfADvjLVHqDX/URuRe82a8xU3MsZdeti+ilrvAePcTdX84l2uk3upg==
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by VI2PR04MB10834.eurprd04.prod.outlook.com (2603:10a6:800:275::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 05:53:32 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 05:53:31 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "Frank.Li@kernel.org"
	<Frank.Li@kernel.org>
Subject: RE: [PATCH v5 6/9] irqchip/imx-irqsteer: Let devres own the clock and
 runtime PM
Thread-Topic: [PATCH v5 6/9] irqchip/imx-irqsteer: Let devres own the clock
 and runtime PM
Thread-Index: AQHdMVV4ObxLbs026k6MWdHCJOjZr7aoTGkAgAeMsUA=
Date: Wed, 26 Aug 2026 05:53:30 +0000
Message-ID:
 <AMBPR04MB12334B795DFA82C1B7E4FD19CEBAE2@AMBPR04MB12334.eurprd04.prod.outlook.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-7-Zhipeng.wang_1@oss.nxp.com>
 <20260821102635.4BD041F00A3D@smtp.kernel.org>
In-Reply-To: <20260821102635.4BD041F00A3D@smtp.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-26T05:43:56.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB12334:EE_|VI2PR04MB10834:EE_
x-ms-office365-filtering-correlation-id: 4230ac01-08fc-44e7-e6e7-08df03365b98
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|23010399003|366016|376014|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 E2yEbCyd/fYyE3x57jHTQH4reDvfsHHk4lqA2+A3zr/EuCA2QtHRp99ZAageYin8CPQxZ9s+4QI2rR9oM8NN/3XtE1z7k7eBb+4xp/NQSSoeTubJswKrztQEireCeRs4M1oVMaoyi50SJn9LiA7m3gKCbH8MFUpq1apyOcMJks9PwnjK5nyD/bLGjXiXoBk4b4vft3gJ171dDvCFtw7+i6dxE2Ccu5jquRBY344bPajK0Hl1Cv2lP6MdUnVEojiV2Q2VMSY2mZtVhbeMf6384XqtjKXnDsnlTH8kspLq0msMQdLyJmDPzfwFaFZv0m1zE2CSZPzYEKDw1TkR9mXIca06KJkGKyp0T0NEIa1p1GblMWXky0QSBfWAiPHo6PPKHXVC2zVdp8/6PsI5RthDvroabCVIyHjaSiuR8BRX3qHBNThWjX+R9zAQ6JCygb4c+qryzoVUfHMeeIN4UqqFsXmtw1FVNJraVv9JnwfRmaebp01PFKh53orbTdXnyG2MWRRSmAZ+AHEWbUKFGO8dL7f5pj0DwAo08I9XWh0sysuOWxCoFsKbnWR/aN6nIkIC3bbg3inN8MUDY9yOZDwOo4RkZ4q4DiPjP832IPca6xOkgPD33rp0lZyDn9uORM/+aXkc7d4DKickM6uEZLFGaYlkl9ns2vSc5n2t+L5T/1k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OVZxN250aE9ianVYWDVMTDJWRW51TmNoMHRpaFhMeXh0anduRC9aTmFrQXNw?=
 =?utf-8?B?YVF4MUZ3WWZHSHpNK3diOTZRSXVIZ2RpMVM2em55cEtRZjNqQ0JidCtiZER1?=
 =?utf-8?B?dnA0VlowenNuQzVQaTdnWVlQd2s3bDFLRjAyNzMzQUJZeHJ4SnRGMk5UL0d4?=
 =?utf-8?B?eS9uTnhQM3NMWVYrcEQ1Slo3bmRBL3Y1TjNoR2F6OVpIU2R2b0NuQXNnTHZ2?=
 =?utf-8?B?UWFBc2JDTlBBbkN0ZEpOQXF4YUNjOVNOZkVpR1pkTHh5OU81U0pyVWJhSnlh?=
 =?utf-8?B?SklEOVNwR0hibkJyL0dvTFpIRTBzWXBubENtSWk0aE1WOXJrYU9TTUdyMkNz?=
 =?utf-8?B?YlRRNm9pTllNcllYTDM5MG5LYjJTUFhFdFNxUDdreWE2YW9nd2VMT0x5Wno2?=
 =?utf-8?B?RXZTdUM4UUUvaE91WlF3QjRuZXFRT0JkbWpUblJGbldJZTFDWXhRNE1uK0pl?=
 =?utf-8?B?SGRGN1plNklTMmNIdmdTVm1GRSt3RDJZU21Na292eUpzM0hQSldnRFlTV0E2?=
 =?utf-8?B?NzBucnJIeVU5MmZhV09IaTJkWnFMMU0wZXBoVUx3d3k3eTM3ZDlGanNMMnJH?=
 =?utf-8?B?ZE1rNVBJaG1mNW0wZDB6ZWRPTE9EU1c0TW1PQVB5THRZMDR5QU5mV0FpMjdG?=
 =?utf-8?B?N3c1NFN2RWZzZlcyTWEyUmxqSkdBVzdmRmJKNG0zTEI5VGxCdTAwb0hER3ZP?=
 =?utf-8?B?TWxpL2sraGQ5RHVwRkJxckp2QnNpOVpOQ214WDJ5RXpvMlovQXlDL1QxVVZQ?=
 =?utf-8?B?OXQ3bVBWcE5tNmd4Nk5HcG1qQ211ZnIrMEVZWjg5aDgxY3VFdUpLd1BGNWp1?=
 =?utf-8?B?a3pLRk85Zk53TG8rTXVrM3Z0cThIdUM2MDlOVzZxdm1lZTZ2SkVnamgzZytC?=
 =?utf-8?B?SkdrMTZhbENkdDRybTN3SXVvVzhzOG5PWU5LTzE1MlEzNWxtdnZIa3lYMXBY?=
 =?utf-8?B?WXJVeWp1UjVDbmRpQWR6cG1paEY1OFM3WDR1WHdzVEgvaHVOeDRLcmw4YWdE?=
 =?utf-8?B?dmlWMk5HUUUzaFJiaGdVUnhNL05sYXlvVEZFM2t1UElidEVXMzN1L29NaGpx?=
 =?utf-8?B?a2h0eWdrajlDTzZkN1BrRkdGdFZETHA3NGR4YVdpdHA2QUlNRFUyMGNWL01D?=
 =?utf-8?B?bUMzL0QzNGpoZnpNRG13SStVQktQY1MwUnJJNGdYL2xjWVF4cEx0ZER5Y1dE?=
 =?utf-8?B?eG85dHZHdXI5OTlpelFkQndxTmx1UnEzWFdDL2xGck92OGFlQ0VPY3QzZHdS?=
 =?utf-8?B?VXdvM2tpNzNZRVNTUXVXZ1R4OWFDNUZzdTFlb293bG1hWVdHUU1vek81c0Ey?=
 =?utf-8?B?UE1HcWJvRFZHSDNpMkQ0akovTERiOUtsTHFvckV5b3NlTGV2QitRUjNka1Bx?=
 =?utf-8?B?bWc0V2JnNlRtVk9HVVBwZDl6Y1JYcUYyTFhCbEg5K3ZsWnNZTkUvVkZBR3Rx?=
 =?utf-8?B?bmJoL0czN3FHTEVYSThFb3oxOExPMlVzZjdxU0FEV2d1dCtIdW1ZVHJacW9Q?=
 =?utf-8?B?T1lvZzRTZmkzS0lydkt3c1c2NDN5T0NYdUFsQ3RkaHJIbm12VnhDR2w5ZHhN?=
 =?utf-8?B?b2VKZTdSWlExSDc5TkpJcy91YkdTZWJwRVVlNlhPaWtiMlF4U25FRkR4MjZs?=
 =?utf-8?B?NUJENWIrejVybElRNWQ5N0FmbzZyZHo1MUVqVFhNN3p6ZVlhUk1ldUk4eDVE?=
 =?utf-8?B?Z2NsdmRBbnZPY2hqejc4ekJRZmJIcW04YkFtbXd3MVE2VkxwaDM2cituYnQr?=
 =?utf-8?B?YVVEbHpFTnFOMGhuSjhxRVFwU3Q3bE9DYjNreFdJVXo4RDRMcmM0MHQ3S0N3?=
 =?utf-8?B?dURUeDVwTXFlR1hKOWl3V0RoVDkrTDUraWRhbHBkRFB5UExiV3RzMytaK1R4?=
 =?utf-8?B?MUF4NUk5VldRVkVrWVg4SDc5NmVlY0I3VklWNTFnUGM4a0FuVmxPMktjOGQv?=
 =?utf-8?B?QXAxeWNFckR4N2FQLzc2ZHZsbXVmWTFaSGVMVURualptQXFwN1dzZWJrOVZ5?=
 =?utf-8?B?OTI4WjhlMUdDTmFLNlRVZ0QwT3RDTVh2MHJsZlkzWmZON2hSWDZYQUlZMHZV?=
 =?utf-8?B?TUZBenE0SEtxNEdTYmxIaGNBc0VjWWRJTkhpc2E1UGJlQzI4bVFsUnZoZDFN?=
 =?utf-8?B?TmdVc0tuS0toaEVnSHZZcVd4ekFmQ1pPRlM4MU1CY3lzekh4L0doSDBscXd6?=
 =?utf-8?B?alVKajdIdisvaWVJTjFZTVBGbW9ZamU1Wmx3MjJzNHlNWVdQMUFhcEUxUjZi?=
 =?utf-8?B?bGNraE9ESGdLTU5seGQ5NXZHWDdJUXhja2VyT1BrbExwendpYmc3U0I2OVN1?=
 =?utf-8?B?cXFRQll1bll5aDJ6SlJKRUJzdHlOa2dmYXVJQjlsVGZUdTVHR1lvUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12334.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4230ac01-08fc-44e7-e6e7-08df03365b98
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 05:53:30.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZwmWCjhIFxNSlHANymz77BEzntyRmN8Go1UP18ePYvrya/eoypMTWE4bqetwM6+YZODjnqLcK2tCkj88+EWjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10834

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDYvOV0gaXJxY2hpcC9pbXgtaXJxc3RlZXI6IExldCBk
ZXZyZXMgb3duIHRoZSBjbG9jayBhbmQNCj4gcnVudGltZSBQTQ0KPg0KPiBUaGFuayB5b3UgZm9y
IHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAyIHBvdGVudGlhbCBp
c3N1ZShzKSB0bw0KPiBjb25zaWRlcjoNCj4gLSBbSGlnaF0gTWlzc2luZyBwbV9ydW50aW1lX3B1
dF9ub2lkbGUoKSBpbiByZW1vdmUoKSBjYXVzZXMgYSB1c2FnZSBjb3VudGVyDQo+IGxlYWssIHBl
cm1hbmVudGx5IGJyZWFraW5nIGF1dG9zdXNwZW5kIHVwb24gZHJpdmVyIHJlYmluZC4NCj4gLSBb
TWVkaXVtXSBJZ25vcmluZyB0aGUgcmV0dXJuIHZhbHVlIG9mIHBtX3J1bnRpbWVfcmVzdW1lX2Fu
ZF9nZXQoKSBpbg0KPiByZW1vdmUoKSBjYW4gbGVhZCB0byBhIGNsb2NrIGVuYWJsZSBjb3VudCB1
bmRlcmZsb3cgZHVyaW5nIGRldnJlcyBjbGVhbnVwLg0KPiAtLQ0KDQpUaGFua3MsIGJvdGggYXJl
IGNvcnJlY3QuIEZvciB2NiBJIGRyb3AgdGhlIHJlZmVyZW5jZSBhZnRlciByZXN1bWluZzoNCg0K
ICByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCZwZGV2LT5kZXYpOw0KICAuLi4NCiAg
aWYgKHJldCA+PSAwKQ0KICAgICAgICAgIHBtX3J1bnRpbWVfcHV0X25vaWRsZSgmcGRldi0+ZGV2
KTsNCg0KcG1fcnVudGltZV9wdXRfbm9pZGxlKCkgZHJvcHMgdGhlIHVzYWdlIGNvdW50IHdpdGhv
dXQgdHJpZ2dlcmluZyBhDQpzdXNwZW5kIChzbyB0aGUgY2xvY2sgc3RheXMgYmFsYW5jZWQgZm9y
IHRoZSBkZXZyZXMgdGVhcmRvd24pLCBhbmQgdGhlDQpyZXQgPj0gMCBndWFyZCBhdm9pZHMgYSBk
b3VibGUgcHV0IG9uIHRoZSByZXN1bWUtZmFpbHVyZSBwYXRoLg0KDQpUaGFua3MsDQpaaGlwZW5n
DQo+DQo+IC0tLSBQYXRjaCBbNl06IFtQQVRDSCB2NSA2LzldIGlycWNoaXAvaW14LWlycXN0ZWVy
OiBMZXQgZGV2cmVzIG93biB0aGUgY2xvY2sgYW5kDQo+IHJ1bnRpbWUgUE0gLS0tIGNvbW1pdCA1
N2I2NWUwYWUwY2NiNzk1MjI1M2MwYmJmNTlmMGUxZjAzN2VhOTM0DQo+IEF1dGhvcjogWmhpcGVu
ZyBXYW5nIDx6aGlwZW5nLndhbmdfMUBueHAuY29tPg0KPg0KPiBpcnFjaGlwL2lteC1pcnFzdGVl
cjogTGV0IGRldnJlcyBvd24gdGhlIGNsb2NrIGFuZCBydW50aW1lIFBNDQo+DQo+IEluIHByZXBh
cmF0aW9uIGZvciBtYWtpbmcgdGhlIGRyaXZlciB1bmJpbmRhYmxlL3JlbG9hZGFibGUsIGxldCB0
aGUgZHJpdmVyIGNvcmUNCj4gb3duIHRoZSBjbG9jayBhbmQgcnVudGltZSBQTSBsaWZldGltZSBz
byB0aGF0IHRoZSBwcm9iZSgpIGVycm9yIHBhdGggYW5kDQo+IHJlbW92ZSgpIGRvIG5vdCBoYXZl
IHRvIGhhbmQtYmFsYW5jZSB0aGVtLg0KPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNo
aXAvaXJxLWlteC1pcnFzdGVlci5jDQo+ID4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLWlteC1pcnFz
dGVlci5jDQo+ID4gaW5kZXggYjYzYmY5NTdhYjg4NC4uYzJmNTg3ODdmOWE4NiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWlteC1pcnFzdGVlci5jDQo+ID4gKysrIGIvZHJp
dmVycy9pcnFjaGlwL2lycS1pbXgtaXJxc3RlZXIuYw0KPg0KPiBbIC4uLiBdDQo+DQo+ID4gQEAg
LTI4OSw2ICsyOTIsMTQgQEAgc3RhdGljIHZvaWQgaW14X2lycXN0ZWVyX3JlbW92ZShzdHJ1Y3QN
Cj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICBzdHJ1Y3QgaXJxc3RlZXJfZGF0YSAq
aXJxc3RlZXJfZGF0YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+ICAgICBpbnQg
aTsNCj4gPg0KPiA+ICsgICAvKg0KPiA+ICsgICAgKiBUaGUgZGV2aWNlIG1heSBiZSBydW50aW1l
LXN1c3BlbmRlZCBoZXJlLCBpbiB3aGljaCBjYXNlIHRoZQ0KPiA+ICsgICAgKiBydW50aW1lIHN1
c3BlbmQgY2FsbGJhY2sgaGFzIGFscmVhZHkgZHJvcHBlZCB0aGUgY2xvY2sgZW5hYmxlDQo+ID4g
KyAgICAqIGNvdW50LiBSZXN1bWUgaXQgc28gdGhlIGRldnJlcyBjbGtfZGlzYWJsZV91bnByZXBh
cmUoKSwgd2hpY2gNCj4gPiArICAgICogcnVucyBhZnRlciByZW1vdmUoKSwgZmluZHMgdGhlIGNs
b2NrIGVuYWJsZWQgYW5kIHN0YXlzIGJhbGFuY2VkLg0KPiA+ICsgICAgKi8NCj4gPiArICAgcG1f
cnVudGltZV9yZXN1bWVfYW5kX2dldCgmcGRldi0+ZGV2KTsNCj4NCj4gW1NldmVyaXR5OiBNZWRp
dW1dDQo+IElzIGl0IHNhZmUgdG8gaWdub3JlIHRoZSByZXR1cm4gdmFsdWUgb2YgcG1fcnVudGlt
ZV9yZXN1bWVfYW5kX2dldCgpIGhlcmU/DQo+DQo+IElmIGl0IGZhaWxzIChmb3IgZXhhbXBsZSwg
aWYgY2xrX2VuYWJsZSgpIGZhaWxzIGluIGlteF9pcnFzdGVlcl9yZXN1bWUoKSksIHRoZSBkZXZp
Y2UNCj4gd2lsbCByZW1haW4gc3VzcGVuZGVkIGFuZCB0aGUgY2xvY2sgZGlzYWJsZWQuIFdoZW4g
ZGV2cmVzIHN1YnNlcXVlbnRseSBydW5zDQo+IGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGR1cmlu
ZyBjbGVhbnVwLCB3b3VsZG4ndCB0aGlzIGNhdXNlIGEgY2xvY2sgZW5hYmxlDQo+IGNvdW50IHVu
ZGVyZmxvdz8NCj4NCj4gW1NldmVyaXR5OiBIaWdoXQ0KPiBEb2VzIHRoaXMgbGVhayB0aGUgcnVu
dGltZSBQTSB1c2FnZSBjb3VudGVyIG9uIGRyaXZlciB1bmJpbmQ/DQo+DQo+IHBtX3J1bnRpbWVf
cmVzdW1lX2FuZF9nZXQoKSBpbmNyZW1lbnRzIGRldi0+cG93ZXIudXNhZ2VfY291bnQgb24NCj4g
c3VjY2VzcywgYnV0IHRoZXJlIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIGEgbWF0Y2hpbmcgcG1fcnVu
dGltZV9wdXRfbm9pZGxlKCkNCj4gb3Igc2ltaWxhciBwdXQgY2FsbCBiZWZvcmUgaW14X2lycXN0
ZWVyX3JlbW92ZSgpIHJldHVybnMuDQo+DQo+IFNpbmNlIHRoZSBkZXZyZXMgYWN0aW9uIHJlZ2lz
dGVyZWQgYnkgZGV2bV9wbV9ydW50aW1lX3NldF9hY3RpdmVfZW5hYmxlZCgpDQo+IG9ubHkgY2Fs
bHMgcG1fcnVudGltZV9kaXNhYmxlKCkgKHdoaWNoIGRvZXMgbm90IGRyb3AgdGhlIHVzYWdlIGNv
dW50KSwNCj4gd291bGRuJ3QgdGhpcyBwZXJtYW5lbnRseSBicmVhayBhdXRvc3VzcGVuZCB3aGVu
IHRoZSBkcml2ZXIgaXMgcmVib3VuZD8NCj4NCj4gPiArDQo+ID4gICAgIGZvciAoaSA9IDA7IGkg
PCBpcnFzdGVlcl9kYXRhLT5pcnFfY291bnQ7IGkrKykgew0KPiA+ICAgICAgICAgICAgIGlmICgh
aXJxc3RlZXJfZGF0YS0+aXJxW2ldKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+
DQo+IC0tDQo+IFNhc2hpa28gQUkNCj4gcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MDgyMTEwMTAzOS40MDM3OTI1LTEtWmhpcGVuDQo+IGcud2FuZ18xQG9zcy5u
eHAuY29tP3BhcnQ9Ng0KDQpOWFAgQ29uZmlkZW50aWFsDQo=
