Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.95
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293262;
	b=KazmPu6TEMwzOb8llsBBODwxRpV2yrDG5wcGoEMjRnA58+Opsr159acEY/5Y5lNcgXvr
	 CYkmwNyqD0Kwt8zQS5FsdnjyvCBfjz0VkWE3I8yxMVkPhOM8YRVyDEaDg7mffQz9uPV1F
	 yOfOWiFgTS5d8sSq3atcqLFTghY4hlF8o1W/i3/pEXPpW7j9f+HcAUFrAEy8aCT67XNGH
	 E/8rtNWOuU+00dwMNOF1jll5VS41f1Vwa3gY+mXbNsQZ1SwAE3YZdsZTOnoYjiFmxV1Bl
	 HQjsqIb9Xh28zPjgh1eUslaMGDsINSvSnGdIZOqt1Kltk2ZxAy8gCKfqVIPv+N8151Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293262;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dG/+d7qdRS3Rypn08EP37x9XYX6JL4SH3lp1vH1L/lo=;
	b=wP0EfHYjAzRhgIc99BFtnwvjAQb/WrVlhGnHjCdmk26cA7BOww8DtuB4u9U6RSUjO8i8
	 0iP9vBMTWr3B2g+cv11JoqiOlcGIOPkSv31uqkX565F5Bn6EiVS2uNQqplVE2BDWDkGwa
	 TJvJXFNnsVKmOLuwKoxgd2gKBS6mA/WL/ws8MJ101/T67uIXKnMOOzYjymbPZAkSgNLfd
	 9+rQ/aog+IBXRNgrWl/Jvo4ZmIjOB6JWOYniGWNeOKuVunWDyifRRTs9aj+MFfE0kd1Ng
	 ZnxuATeHqoNsgpT14LldeLLcYNuRn62Q2oCxkrsbEELrKop6MVv2mWGnqfRKD2mnagQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=VwAHz306;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.95
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022095.outbound.protection.outlook.com [40.107.75.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C12606A326;
	Tue, 10 Nov 2026 06:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C12606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=VwAHz306
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyXhjT6yphqZsdXQspdL7IsDQ/qM/v5hgCsA38Smds88qzC22JpVzVPR6mlVCsGxfqF6BCPaxxKNfX90rNn7/RiCH+VBZxYN4S3f5Z7vmpwfsW5eA3blMaj6s1VvFIQs4tNIe/1ybeZwwDzb7gOoDfzNavKxaPgmUrSPjEJUD1nrDUbHUoQu5BAwfA7tKvxWqvlVjVe173BHCLPkZP1KxC01wKUFV7i6V48iNcRdb27tcHMg+JZcG3hSoSj64xyYDYq73HDgzLwgWNQP4gug1l4moVVBMzjbfyPzSQICd1e8RIfpNnhHIAEkZbwbTeHkY3mAO1ome9T0w8P8/6vhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG/+d7qdRS3Rypn08EP37x9XYX6JL4SH3lp1vH1L/lo=;
 b=beJ+E7Z1caAGXXDVp0uw79MOd447tNpqFgsxlMcmJ96umSuhUK/lohlJrHMSawukxGcWwrhicHKdPQNwv5/6sjNYXXsJKxUt0hMv8l3hBPW7HxfKg+DsyINAwzpnFT8x6B/z+bXSqYIKqsNdkXhGsPC5f1BQt6xkg+ZvBFcFLk5RXXWfWW2xzyTEMkCUyv7zvlcJidXKNe5kUR0GmdqCinaPgqgrRkopSB81WBMqvdlDQVsUSH06brSIQXzy+XgRcfd7DrhX1FiQT+Hwr8Ux3V61w1PiiHao4qT8FW2Spght/BuK3fMKIWe7eDsXa3eBTgQtpjgN8wkHGjffAnpo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG/+d7qdRS3Rypn08EP37x9XYX6JL4SH3lp1vH1L/lo=;
 b=VwAHz306GiQkvo37EAc3M8NFLFmd9O6Pgb7MS8UJglmyuxcSOtSvupyLxg+/6xK8lJ/a7qlmn5bBkc1OkGFlVvmx1rsL4F7IpwQ4tbgYqIwXnn+uaWG2qKPJek/71Caz3sI5uSa7GXbaRwOEBHLpjEXGs45JEjA3f3n+BOSWhc/EkczNMzccdV8rVOh81aOGhd4IqxmyR31U1byU6HndqvB9ilKC+WoqSmBHhKMHSbJ4ze9LcmVJEP45A9+qHJ2voiPdty3srMNRifS3Cy6YQddgE3ck3LVvBcYJmpbkfI6DbUS5/p5Wc9IFmU3FyH+cVxKk3y0hXsYuIONiNrkfUg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by TYSPR03MB7476.apcprd03.prod.outlook.com (2603:1096:400:432::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 06:47:38 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40%3]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 06:47:38 +0000
Message-ID: <71f13431-ab14-4bf2-8928-125c7af554f9@amlogic.com>
Date: Tue, 10 Nov 2026 14:47:35 +0800
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/2] i3c: master: svc: Add amlogic a9 support
To: sashiko-reviews@lists.linux.dev
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
 <20261106-a9_i3c-v3-1-804b69b9095b@amlogic.com>
 <sashiko-outbox-200995@kernel.org>
Content-Language: en-GB
From: Junyi Zhao <junyi.zhao@amlogic.com>
In-Reply-To: <sashiko-outbox-200995@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::6) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|TYSPR03MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 32172fd0-f9d4-4f6a-e425-08df3ef68238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|18002099003|22082099003|6133799003|10067099003|4143699003|5023799004|11063799006|261028144727099003|261102123227099003|261009223027099003|261026130827099003|261026140227099003|261026121527099003|261026135527099003|261022115727099003|261022075727099003|56012099006|261021133027099003|261021130227099003|261022113327099003|261021121427099003|261022105027099003|261021135927099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	Y+I5K8H6iM4bPL1b5fn3kdqT3h/Z+uJcQdV7iCIskn0PT+Iwg9cHYOIcWQH+qJECBzfU8uxWDwID8JSV37TN20oT6Rp7zg/Luxi4YY1X02FV6r4mZvXj/IoRUtRAUytYA530BUv1jsj3HkCo9F+NZ2X9H85c4Q2ISA6vLIcOsXEqnk8oBNR5mCwf+LDIn0ksIus5cbLdJAQeFr0zl0AaP6SGf8I5yIoNvRUq4rEJ2fTz2cdEjgy2sMpYiry9cKCOoZVt4WtC/msj80eUbIeN2ndSJZwJs3086v9QBz8TMzCMlIkmkbI6/7wOSIqfAv4i4F8YOcIUfhBIK1X/8bjsWuUnDtwBg6qT80zWWEj3F2NlKSztzCyv5B4Md0Kp9u6kIApAM4eGLv9W2nne8yUCq6LGACgV4c5xJzNBXeh4mui3yiJsAJnHzuWVRA8Qn5/UD/m0edN6D+EEkbE4MK6vojXhVME1Gmk1Amzt3vlmnrLMofJr7xD+AI15qn9LoUcdE7fiTKbf609VhBWFDwiuOYBtIG12bshRY9ERN/0JCU9bmwp6WoJus4ZAQwynguMd1vcEsEQntAR7Pgg6mDpUuH5RNPscyRKGOyFY4JbEejI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(5023799004)(11063799006)(261028144727099003)(261102123227099003)(261009223027099003)(261026130827099003)(261026140227099003)(261026121527099003)(261026135527099003)(261022115727099003)(261022075727099003)(56012099006)(261021133027099003)(261021130227099003)(261022113327099003)(261021121427099003)(261022105027099003)(261021135927099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkR5czBrbGx4UGduUUtjeTVMcnF6VExQYkwvWWwwelRUeXJiRm5oelBBL3RB?=
 =?utf-8?B?OWFLbWlVcmhkeTBKRkdsZHZpSnVSeXFaY3ZwVU44L3Q5V0RFdnJJU25teE01?=
 =?utf-8?B?RktXL0dNTXdSUGRpd1ZCMUFwaDQ5d1RaZmhyOExEWVFsVmZ0K0xXaVMxWjVt?=
 =?utf-8?B?YTR0NlROMldYR0ROcjg5SFN3b2VhV3o5elpxSXV4SjhUellucVFCWFYyQnNz?=
 =?utf-8?B?M0JWb1YxeDVIcVNDVE1taytPc1h0NlJmR00vR0syR2dkNjR3MjdVR3pVREJO?=
 =?utf-8?B?a095TzNzbHNMSnN5V24wL2c0THJRZHdXcEl5YUw1L2FTRXBYSHhwUG1uYllk?=
 =?utf-8?B?VldlZXBkUmRkbzNXb3M5RjA4WE1mbnlUTmxLNm9UaDhueWwzcWsxSnhxRzIx?=
 =?utf-8?B?dWEvS1Q4Q2taK3JRdHRjUGJKTTBoNmxZb0JWcDNVZmUxblJvaGRiNWlILzdF?=
 =?utf-8?B?UUMwdmg5Vkp6bS9GWmdVNHBSVTNRVFpUZTZyNjBPRXBrbzU1RXJjdEJPaTZn?=
 =?utf-8?B?UVZvZ0FSYVdOM2gvVWhlc29ydnZxVmdDK1A2Nm1HUCtRc1U3bUNQVzZyK1RE?=
 =?utf-8?B?bUlkbGdkVnF5dTByaWtkSEtBNStrVFZBNUpOdHRtQUlSdkNsVlZjbFhVeUVp?=
 =?utf-8?B?UXI4U2psbmdyZE4rQXZ2ZnM0NlQzTVRhTGVYOFBDUkVwSXQ4QnA4ZENWYWJH?=
 =?utf-8?B?cEtNU3ZDR1pIKzZZQXY2ay9LeHphYjNvSTBiM3pPcEFhYUdtWGtLOFJSWnA2?=
 =?utf-8?B?OVpnNG1BL0R6ODRGbnRDYkVtVlBCZVlRQWlyakZFdWs0ZHlhT1JOOTZPTlFI?=
 =?utf-8?B?OGRMWUxNYTk3SFRMQ3NiZzE1T3V1cjFSV2VSSllRcDlLSUxuZXVGeDYxQkVK?=
 =?utf-8?B?VmZyeWJ0ZFVFWGF6UlZVdGJWak1tYWNPei9VV1pKRVNGVUJPVkZIam9hT1BV?=
 =?utf-8?B?QTBybGtyQm91Q0ZsUXJFcmZ3RzZ0enorUFFZYzdzWXZhY2NVbXJRbU02dDVR?=
 =?utf-8?B?eEE0aDJwTGZRN0lCTlVpZkg0cWxqeGxLcmF2b0NDSzJqeDNtcERhb3ZYN1h4?=
 =?utf-8?B?cVlBaTlhcWJHc3NFU0lxcjdqYnRRMXJUVjJTcXZBRXBmQXJkZThkSFcrMm1L?=
 =?utf-8?B?R1AxaEIvaGgwdWVGaXhtQm5WL21mbHZlbmoyN0RNdUg4ZWtoNnhzTk1wRnMv?=
 =?utf-8?B?Q0FUQmNWZHJHbUlNNnFMSkhjeHpmT1paeXhlQVVUa1RKcG8xcVZoMzUydENF?=
 =?utf-8?B?a0pNRVJENFlHVjc1RHh5Y1JleWNmTjl4WVozYkEwTkF2bFZYTzF1YW5vSVhW?=
 =?utf-8?B?TU9mWFNJeG5za3lBVlg3Zk9VTzZEdGVzRDEvaTluTHVOeUN6dzNYM0M0eXBa?=
 =?utf-8?B?ZEkzbFYwb1QxbDdHakxTZ0xhRHlhMm1halVBVlJTZ1VRNkNXaEJpdFFpZWVC?=
 =?utf-8?B?a3plM2FjdTdNMEh4YkExV1ZOQWt2Uzd1K0h1bEozVjdtM0VEbjBpZnFCeFQr?=
 =?utf-8?B?ZVVId01ZRXpZRDc0bkpFSWdvaXpmRHM0ZFJTalN5cWRnNHRlTlliSVdCVFBh?=
 =?utf-8?B?ZHBKTW5KMmdpV1JTOWQwbndEU21pdnBZYU9wSHlUMTEyM052dks5amNRUDc3?=
 =?utf-8?B?L1dwN0tVVm83UUI5c3hVMHFEYWFPZ2hxdGVsaUJjRGVxRGU2ZmNTODhnaksz?=
 =?utf-8?B?dy9VQmxMZVhWZGZJS1ZNdHpURjJkNGRCRDZMaStQK3ZwK1Y0dTFQQ3IzN3pQ?=
 =?utf-8?B?UUE4STB1VC9obU5mdmZCMEVIdUIxSGs0TVhiZmhDWElFNmxVRUwxMzRjOGdV?=
 =?utf-8?B?YXRKSjgrbXppOWUxQm9HeHNDSUhBQ0xqT1RSczZQbXB5aU0wV3ROU1ZMdmFm?=
 =?utf-8?B?OXkxdnRBejFkeTVGZVJ5S0RQczA3ZGZYUnJicThjd3ArUGQwTk5LZnByM2xx?=
 =?utf-8?B?bDZtNEVOS3JUdzc5ZzZ5VUczajVxb0hKUmNNYTQrVlIwSnppWnd2eU8wU1Ns?=
 =?utf-8?B?TTdmS2lMOHM5TTRKczJtOHV6ckJObjNHN0R2d2g0Mnl5b3BramdONlB4b0xh?=
 =?utf-8?B?WTdqOHgvMFFhWXBHdFlkcStmRG5UZHJCWHZRUC9pcDhHcll3SDFaT3UwcFIw?=
 =?utf-8?B?Z1BXNDgwaUd3VHAwcWR3WHBQUmVYTWpZYXJoUXJGVlgrYW1mcisrNFdjTHRw?=
 =?utf-8?B?am4yT2NGN3FxZWY3aHEwakkzQ3Y5R2JPOG9JYTlvZWJKYWRFV0VMTXo1cDhH?=
 =?utf-8?B?RXlCNU9yZFBDcDRPT0h0UFJQajNoYlBLdDBoWERIcmJQVUtXbGJhZTB2YktI?=
 =?utf-8?B?WkUrUmU2a2xTcUxHdzNoUEJyL0dRZXpzUTBqTGJuL2RxNGE1LzhUQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32172fd0-f9d4-4f6a-e425-08df3ef68238
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 06:47:38.0550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHB+twcULcwWzsnwiSeyf3GgpoxBnR0D2YGxfoEXUA1c0CCgY6UYHMTVUlZtRSdgoDcRVv0VFc+Jy9au2CnkTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7476

Hi sashiko,
Thks the detail.

On 06/11/2026 15:32, sashiko-bot@kernel.org wrote:
> [你通常不会收到来自 sashiko-bot@kernel.org 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
> 
> [ EXTERNAL EMAIL ]
> 
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] i3c: master: svc: unbalanced fclk disable in
>    aml_ao_i3c_tail_clocks()
> - [Medium] i3c: master: svc: NULL dereference of clks[0].id in
>    aml_i3c_init()
> - [Medium] i3c: master: svc: unclocked MMIO read in
>    aml_ao_i3c_tail_clocks()
> - [Low] i3c: master: svc: duplicate fast_clk lookup in aml_i3c_init()
> --
> 
> commit 13e8b1ef64cdb3b2e6850ddcbaa3e5a7ffee2a56
> Author: Junyi Zhao <junyi.zhao@amlogic.com>
> 
> i3c: master: svc: Add amlogic a9 support
> 
> This commit adds Amlogic A9 and A9 AO I3C controller support to the
> Silvaco I3C master driver, including a vendor_init callback that registers
> the AO variant's internal clock divider chain and configures the fast_clk
> rate.
> 
>> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
>> index e700392f0801f..aef56286ecfa8 100644
>> --- a/drivers/i3c/master/svc-i3c-master.c
>> +++ b/drivers/i3c/master/svc-i3c-master.c
> [ ... ]
>> @@ -2019,27 +2049,43 @@ static int svc_i3c_master_probe(struct platform_device *pdev)
>>        if (master->num_clks < 0)
>>                return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");
>>
>> +     ret = clk_bulk_prepare_enable(master->num_clks, master->clks);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
>> +
>> +     /*
>> +      * Vendor specific setup may register additional clocks (e.g. the
>> +      * internal divider chain of the AO variant) and program clock rates,
>> +      * so it must run with the clocks enabled.
>> +      */
>> +     if (master->drvdata->vendor_init) {
>> +             ret = master->drvdata->vendor_init(master);
>> +             if (ret)
>> +                     goto err_disable_clks;
>> +     }
>> +
>>        for (i = 0; i < master->num_clks; i++) {
>>                if (!strcmp(master->clks[i].id, "fast_clk"))
>>                        break;
>>        }
>>
>> -     if (i == master->num_clks)
>> -             return dev_err_probe(dev, -EINVAL,
>> -                                  "can't get I3C peripheral clock\n");
>> +     if (i == master->num_clks) {
>> +             ret = dev_err_probe(dev, -EINVAL,
>> +                                 "can't get I3C peripheral clock\n");
>> +             goto err_disable_clks;
>> +     }
>>
>>        master->fclk = master->clks[i].clk;
>> -     if (IS_ERR(master->fclk))
>> -             return PTR_ERR(master->fclk);
>> +     if (IS_ERR(master->fclk)) {
>> +             ret = PTR_ERR(master->fclk);
>> +             goto err_disable_clks;
>> +     }
> [ ... ]
>> @@ -2163,9 +2209,213 @@ static const struct svc_i3c_drvdata npcm845_drvdata = {
> [ ... ]
>> +static int aml_ao_i3c_tail_clocks(struct svc_i3c_master *master, struct clk *parent)
>> +{
>> +     struct device *dev = master->dev;
>> +     struct clk_bulk_data *new_clks;
>> +     struct clk_init_data init = {};
>> +     struct aml_i3c_ao_clk *ao;
>> +     struct clk *fclk;
>> +     char name[64];
>> +     int ret;
>> +
>> +     ao = devm_kzalloc(dev, sizeof(*ao), GFP_KERNEL);
>> +     if (!ao)
>> +             return -ENOMEM;
>> +
>> +     spin_lock_init(&ao->lock);
>> +
>> +     snprintf(name, sizeof(name), "%s#div_en", dev_name(dev));
>> +     init.name = name;
>> +     init.ops = &clk_gate_ops;
>> +     init.flags = CLK_IGNORE_UNUSED;
>> +     init.parent_data = &(struct clk_parent_data) {
>> +             .index = -1,
>> +             .hw = __clk_get_hw(parent),
>> +     };
>> +     init.num_parents = 1;
>> +
>> +     ao->div_en.reg = master->regs + AML_AO_I3C_FCLK_DIV_CTRL;
>> +     ao->div_en.bit_idx = AML_AO_I3C_FCLK_DIV_EN_SHIFT;
>> +     ao->div_en.hw.init = &init;
>> +     ao->div_en.lock = &ao->lock;
>> +
>> +     ret = devm_clk_hw_register(dev, &ao->div_en.hw);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "failed to register %s\n", name);
>> +
>> +     snprintf(name, sizeof(name), "%s#div", dev_name(dev));
>> +     init.name = name;
>> +     init.ops = &clk_divider_ops;
>> +     init.flags = 0;
>> +     init.parent_data = &(struct clk_parent_data) {
>> +             .index = -1,
>> +             .hw = &ao->div_en.hw,
>> +     };
>> +     init.num_parents = 1;
>> +
>> +     ao->div.reg = master->regs + AML_AO_I3C_FCLK_DIV_CTRL;
>> +     ao->div.shift = AML_AO_I3C_FCLK_DIV_SHIFT;
>> +     ao->div.width = AML_AO_I3C_FCLK_DIV_WIDTH;
>> +     ao->div.hw.init = &init;
>> +     ao->div.lock = &ao->lock;
>> +
>> +     ret = devm_clk_hw_register(dev, &ao->div.hw);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "failed to register %s\n", name);
>> +
>> +     snprintf(name, sizeof(name), "%s#gate", dev_name(dev));
>> +     init.name = name;
>> +     init.ops = &clk_gate_ops;
>> +     init.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED;
>> +     init.parent_data = &(struct clk_parent_data) {
>> +             .index = -1,
>> +             .hw = &ao->div.hw,
>> +     };
>> +     init.num_parents = 1;
>> +
>> +     ao->gate.reg = master->regs + AML_AO_I3C_FCLK_DIV_CTRL;
>> +     ao->gate.bit_idx = AML_AO_I3C_FCLK_EN_SHIFT;
>> +     ao->gate.hw.init = &init;
>> +     ao->gate.lock = &ao->lock;
>> +
>> +     ret = devm_clk_hw_register(dev, &ao->gate.hw);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "failed to register %s\n", name);
> 
> [Severity: Medium]
> Can the clock framework read AML_AO_I3C_FCLK_DIV_CTRL while pclk is
> disabled during runtime suspend?
> 
> svc_i3c_master_probe() invokes vendor_init() before calling
> pm_runtime_enable(), so clk_pm_runtime_init() sees
> pm_runtime_enabled(dev) == false and leaves core->rpm_enabled unset for
> div_en, div, and gate, and none of the three clocks sets
> CLK_OPS_PARENT_ENABLE.  Once svc_i3c_runtime_suspend() disables pclk,
> any clock query (such as reading /sys/kernel/debug/clk/clk_summary)
> calls clk_gate_ops.is_enabled or clk_divider_ops.recalc_rate and performs
> an unclocked MMIO read of AML_AO_I3C_FCLK_DIV_CTRL.
> 
clk_bulk_prepare_enable is before vendor init.
So, pclk enabled before registering.

>> +     fclk = devm_clk_hw_get_clk(dev, &ao->gate.hw, NULL);
>> +     if (IS_ERR(fclk))
>> +             return dev_err_probe(dev, PTR_ERR(fclk),
>> +                                  "tail i3c fast clock failed\n");
>> +
>> +     new_clks = devm_kcalloc(dev, master->num_clks + 1, sizeof(*new_clks),
>> +                             GFP_KERNEL);
>> +     if (!new_clks)
>> +             return -ENOMEM;
>> +
>> +     memcpy(new_clks, master->clks,
>> +            master->num_clks * sizeof(*master->clks));
>> +     new_clks[master->num_clks].id = "fast_clk";
>> +     new_clks[master->num_clks].clk = fclk;
>> +     master->clks = new_clks;
>> +     master->num_clks++;
>> +
>> +     /*
>> +      * Keep the clk bulk state balanced for the following
>> +      * clk_bulk_disable_unprepare() calls (error paths and runtime PM).
>> +      */
>> +     ret = clk_prepare_enable(fclk);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "can't enable fast_clk\n");
>> +
>> +     return 0;
>> +}
> 
> [Severity: Medium]
> If clk_prepare_enable(fclk) fails here, does the err_disable_clks path in
> svc_i3c_master_probe() call clk_bulk_disable_unprepare() on an unprepared
> and disabled fclk?  master->clks and master->num_clks are updated to
> include fclk before clk_prepare_enable(fclk) succeeds, which will trigger
> WARN() assertions in clk_core_disable() and clk_core_unprepare().
> 

Thks the detail.

Could move clk_prepare_enable(fclk) before creating new_clks.


>> +static int aml_i3c_init(struct svc_i3c_master *master)
>> +{
>> +     struct device *dev = master->dev;
>> +     struct clk *fclk;
>> +     long fin_freq;
>> +     int ret, i;
>> +
>> +     if (svc_has_quirk(master, AML_I3C_QUIRK_AO)) {
>> +             /*
>> +              * clk_bulk_get_all() preserves the DT order, and the
>> +              * binding restricts the AO variant to exactly one clock,
>> +              * which is always "pclk".  So clks[0] is the input of the
>> +              * internal divider chain.
>> +              */
>> +             if (strcmp(master->clks[0].id, "pclk"))
>> +                     return dev_err_probe(dev, -EINVAL,
>> +                                          "invalid AO input clock\n");
> 
> [Severity: Medium]
> Can this dereference a NULL pointer if the DT node omits clocks or
> clock-names?
> 
> devm_clk_bulk_get_all() returns 0 with master->clks == NULL when no
> clocks are present in DT (passing the master->num_clks < 0 check in
> svc_i3c_master_probe()), and leaves master->clks[0].id as NULL if
> clock-names is missing.


The DT binding requires the AO variant clock to be "pclk", so this case 
cannot occur.

> 
>> +
>> +             ret = aml_ao_i3c_tail_clocks(master, master->clks[0].clk);
>> +             if (ret)
>> +                     return ret;
>> +     }
>> +
>> +     for (i = 0; i < master->num_clks; i++) {
>> +             if (!strcmp(master->clks[i].id, "fast_clk"))
>> +                     break;
>> +     }
>> +
>> +     if (i == master->num_clks)
>> +             return dev_err_probe(dev, -EINVAL,
>> +                                  "can't get I3C fast clock\n");
>> +
>> +     fclk = master->clks[i].clk;
>> +     if (IS_ERR(fclk))
>> +             return PTR_ERR(fclk);
> 
> [Severity: Low]
> This isn't a bug, but this fast_clk lookup and IS_ERR() check duplicate
> the identical loop that runs in svc_i3c_master_probe() right after
> vendor_init() returns.  Could master->fclk be resolved once in a helper
> or before setting the clock rate?
>> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com?part=1

