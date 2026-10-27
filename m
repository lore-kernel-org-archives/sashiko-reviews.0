Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793076472;
	b=UHt2KI/XdUQbfRTZtuIVyl+8tIejCUbLgLWvnqMwg2y/V3mTXLN5omWYiSFxt9qNVqN4
	 zndfNuUdTlDuHpYiF1G/TfeX/M2vX9bJ3wD86MbpIZJJ83gyRDR4zxOazVmL/DmLa7BRG
	 PV6RlNRI5Sosg0tg+jrNr8/arqx4WnpsKgHjn3Bu+CLFuH6h8GRFGu/GbFKsJiD5/nEm1
	 rpmOtKtLGvsIvvnAYxqD1PSraVWOicGGtRE0Ks1/QlF+fIg0XdRLcbC7xg6RPk+X2g0vj
	 JJTuq8WJ7WcANfzX9ZFEE2Z0pvk4N0h8h4ym590zuQ3owz3x46E220Ky5vM/Y31M9rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076472;
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
	bh=yzuVcSfROtOwYbS0WYhoBxBO5fPLgfIjwbFSoMYBSug=;
	b=T7b0zpUTdAsLvxMqSkBrHzite2EWF+2akCy2vc1XeW2LJGo3AJullmNo0p/J5yn6IczY
	 LDzN6EucYEdyrxUIrqE6HDrHZLzRNhga7G4tAA6b77qLzGEJUET76qBdvk+ocL/nm1nED
	 JUsjLh6vBXmo2F8CWRHgm4nF9QPBW58f4mBYUPjXzrWYFGacTbCsYo26hG4PaYhCpXrlB
	 ARh1FqymsbXE2t6nMppl20VpkolqhcAefvTdq1yNomzWev+wUm9f0llesRl8enzoMKRZE
	 AIm4uDD2uodTm5x5VIqtQiEoq1sqt2AVMkxyoHlO8lHZIfVG0JX8cAXcxo6K9Nab8tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X98fPH9J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.9
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E7F606A31B
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 04:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E7F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X98fPH9J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHfWZ2qSm8LYyA9TwrYvIyQydm+fhON+aJeibl3CNXIQ7sUlcwvaXlUDoyWSlQeqQ908cagDd7f/MNa5lCI9oIeznoTtzt74UIAY4QMvysWwkIJeqfjijHQt40+kndnGSgBVIiXgefl/SD2kYkH+OAOS3dnexYTjZBVP4wnAoMDGwFgdeYijaSzAf7jugJd0n+iRpo4gNQu5Y93E3O8EYzk3zQPjS33E0paMeSlBrzLK+GCYszCfD0kLv39c6c+r/2+YuE2ahB1XV1IxnOx9+ZQF8cii/RpuSYxlRWGQQ4KllW4a/WAPa4Y0vmnwwJ65IpQ3jyswZ5KZHOIe1/fDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzuVcSfROtOwYbS0WYhoBxBO5fPLgfIjwbFSoMYBSug=;
 b=OXqSYT6wrqJpUTLk3gEInZPSZxSS51xoouILn2IzSruHcWUAFtj/aSDrfj1pNb2CQeJKfhXiMGoD/XofStFrVuMn1tEBM9RJgzBT3lPqLayD3LbDiZAECyk1CopGJH6EYUuUYBnLfiAzx0ZqlS4AKP0d849KXNIKGiFV41H/SsUx7wocLiJPrksoS2gh7Cmj8OSyyzImwjFbzC7rdEuztIkL5f8vaakHJ2zcpUtq3acCeyXOuhdXH9lBff7HGBxwhAqrPmiEi53MktyGgQgIhcuGHv4Ye/QR/ib1I0c7xhc7/4/Pjsm6N+hWKH/CeQP1tUlO2LdMxrZFnBCseDnugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzuVcSfROtOwYbS0WYhoBxBO5fPLgfIjwbFSoMYBSug=;
 b=X98fPH9JzDSjvJ1L22W4lIw+dZe4oWFzni4ADzMkilpj0XxtkCY1/SNkxXfj2Fb09opaO5Z//UWlqrEGdSRRkiwcbdyhZVV9L9xRmE2EnnFSOpCvFteAUP3d8BzlFsgMk06pLx98XfNpkczZpcN+YTSHZCu8HPA2oqnBFTFx5pc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by CH8PR12MB9839.namprd12.prod.outlook.com (2603:10b6:610:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 04:47:45 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 04:47:45 +0000
Message-ID: <0dd9ead5-5ed3-4b47-a343-c3a94eb9ad28@amd.com>
Date: Tue, 27 Oct 2026 10:16:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] soundwire: amd: fix ctx leak when
 sdw_amd_startup() fails
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 "N, Poojitha" <Poojitha.N@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-8-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-184836@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-184836@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::11) To CY5PR12MB6252.namprd12.prod.outlook.com
 (2603:10b6:930:20::17)
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|CH8PR12MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 451cf756-f602-4e1d-c810-08df33e5713d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|261026121527099003|22082099003|261009223027099003|56012099006|4143699003|11063799006|261021123027099003|261022105027099003|10067099003|261021121427099003|261022075727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	8fYhL5tsNRlp6EUJnI3Zi4NfscL6asMmWT6Nk49BvhnSv3bagUcZ2pRsOtHEOUMIcHSBp12SfkZH1xB+e38zTh+pzGtu7fR1iHmoXq9Tme3tZMatDd21GGpKnDaw8QwIomwj/onD8s+fVfS/Evai/WqJs0I4vwOsLk2KoiS201Vnym0PSSs0Y1n5Iuq7zVkwoBmfbjdfLpUaUqTtMUzsU2MagGVwkNefydgnAKcvPTElSMm+nPV20epyBH0qFiUN9odOSqWGGH6qIlNSPKcsxAe1foku6Q09Wlbe2Rzff0ACbzYhonNDhl+Dylsn0XjSUNM+q7+2q1Z69nOg5pzvEK6mniKHTPccM26wVsussd7SQNZLTLlD0VXsFi1txqHgeVIdKm5YrDpZfRJiDLOM/tLwNhueN2UC74eSJdVgkOMLc2aRXRAe0AEdFlwrxmZ8YDjln2v721u+vQ5qjt6q4zxzF8yIZwetrrSlPXAmeZF1mp1aV2bhMNJtc15bWIMtlcB7vyK+znUN5Hxohk0aFY/2Rf16OT18BBNM+YLONt9aV9U/QnPcfyElSM4qEbu9JP348H0BTfamVb+kDwfLrvGh0C137Zjx2FqArjFxc6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(261026121527099003)(22082099003)(261009223027099003)(56012099006)(4143699003)(11063799006)(261021123027099003)(261022105027099003)(10067099003)(261021121427099003)(261022075727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmlNWDNSNENPV2k5bmthRjQ1QzF1T3Badmh1dm41MXQ5cS9ZaDFkT0wra3BN?=
 =?utf-8?B?TlRLNVI5WitMQ2NPK0VNd0dURzcxQmE4M2FLcDlGSkVKdzlQb2NmbEtycExI?=
 =?utf-8?B?UjNpSDJnL2xIZlRFYWlZbit6S2ZhWGNLU3dwVVplTUJvcUlDWnQzQW84YWdY?=
 =?utf-8?B?WTJNUEUrbEJ3MEdDbTQyMUZDeVFFVTQrWjMzbE5BVHZlUXd4UUVMY2tpL2RH?=
 =?utf-8?B?ZTZ1bVJrT3JFaDhGN0k2K2grcGs5Nlc3eXo2RHVGMS8vMkdqNk95SnVydTNw?=
 =?utf-8?B?TGlVUWtyVWozalY3VVA5NmVRT3Y4Q2p6OE55R0w2WnJJeXp5VFg5c1pBSXpi?=
 =?utf-8?B?dmorZ3lmWEtWUmpPV1h4VDBhdlFQSnd0QVRLMG95REZqSDRpa0cwcFBTcmxH?=
 =?utf-8?B?QzExMjBpZ0phMUIyaWlwa1RTS0kxclpQQzVjZUdWYkZiZ3hORmxEWnVleVdi?=
 =?utf-8?B?V1VWaGg2YnF5V3pKNjVEajVNZEFDYml3NlZyRGpoSy9VYWRSV0lxa2dzRnNV?=
 =?utf-8?B?eEt4cDQrbndZV3hzRkJRL3VMckNvVm9aWnRvYWJoN1BwS25ucU9ReC9FS2FL?=
 =?utf-8?B?VnVxN2ZCM3lXaXFIMEw0eDhZSlhMMFJGRXdUR1VKU1RBeTBMZVJSY3BtaUY5?=
 =?utf-8?B?ejdYV2N1dDF1YU5GTUlQaTM3azlScUJkaHNkdURZZG03Mll5b1RCcUVoYTA4?=
 =?utf-8?B?SVZHSVp6ZHlNL0g2MW1IbjVWMDVBZU5QR2lCZk1qVjNUS2Jkc2RlRlBDd2tO?=
 =?utf-8?B?WDV2czh1V3Mzc1NUSk13amk4Z1RRRnVscEZadEJYWVlibk8xMjRmYkUrQjJl?=
 =?utf-8?B?cVdnT0QrZm5DWlJGWDJ5UlZ3Nm9ITnhqdXBIbyttTXNTOE5kUmFvNUlWaVFC?=
 =?utf-8?B?VHZjS2hmKzRXUXh5SVVRbzBnTVp1a0RTRERzMGd2blRFTytzQWxZbkZrTDFo?=
 =?utf-8?B?SkJ3U0hmT0c0c3NqRHZKYUNHaTJXcEFzVGNGVVRuSHp6R3ludEhPdUJNT0dr?=
 =?utf-8?B?NGN5SkdvM2s2UC9IT1Qya25IckFuU2YyQjQxdHVuUXJ3eGNsZXdlTEpBL3lz?=
 =?utf-8?B?Q3RpeTRZSzczdWdhNXFmWVk2YjF2ZG5DclZ2QS9kN2hZQVBKRm5XL0FvOEor?=
 =?utf-8?B?OU1NVWJuVGlUdVFqZDR1MS9XWWpjekRCTldsVVhPTVMrQmlKYTU1eHdOeUNq?=
 =?utf-8?B?eW9USU05ZWFkR0syaXVOQ1h3ZW11YlZWdnhVNWJENDlVZjMvS3lQb3Njbm1h?=
 =?utf-8?B?VEdVRmtNTlJmOXVlM1RWU20ycFJCUkJJQXpBaXp5OWMvbnYxMTMwSnVJd3Zv?=
 =?utf-8?B?bWJsdFU1cU8rc29zSk4zSXEreFdTVXgrd3BEb003dUpQMUo2N3hhaW9sQ0pB?=
 =?utf-8?B?YkZtRjZMSm5EWjRYOHlvVHBQREFBVE1RTFdzOHNmTWJpakJ1djkwUVdyTmd1?=
 =?utf-8?B?b2Z4MDgweWUvclNNN0JlTDhKSFZiTEtUdkdLcm1uMzd1Q29MK0w4UWFYVzhp?=
 =?utf-8?B?Qk8rK1FTZVpOVkd3UmgrZFJrZUVtaUZyUmdCVFlQQ3NldlA1RWhPUXZvNGJC?=
 =?utf-8?B?SE1kUlFXTUM0SitIek9Ob0FhZnZWaGZVRXArRnhjaG4vZlBKTHVlUVdOdFZu?=
 =?utf-8?B?Mloxek1mdXQ3Y1BXR2FtMnhqenZWZU5kR0NYakM2WmhOcG1tT3JWQ2hPVy83?=
 =?utf-8?B?MnhhYVVoeGJuUXJzSUNWZXRMTU9PV2NMMzFkeHhoN2EyeExFQkFtNCtrZGR3?=
 =?utf-8?B?VUxXMk9nL0JJVW9rSUxDUlFaV3ZQVFc0YUJBQ1dtV1czTk1IbjhSRUhOWTE2?=
 =?utf-8?B?blc0bW9FdzdaVjBqdXJNYzZPRkpIbjV5UEN0MXljL2dQVlV2L3VWTWo0cXp4?=
 =?utf-8?B?VFZuWVo2M3paSXhWcWxORWxwaVlrcWRraVkwREV6NGI0ZlJwdGIyRFhNamY5?=
 =?utf-8?B?UkhTYytnek1LeHhzc1Uzb3cyOUFKMExQcDBFdXdBdjIvZmt2QjIxWGxERWhK?=
 =?utf-8?B?NVhaZHIwREd2L1MwU01NTGc1dFUxQVlGTXV5anVjamlIRjlpZm9jTFdzVXJE?=
 =?utf-8?B?N0VtV0hPR1F0RFZsSm42c2dxSGNYaHRlRzQ5SUYyWGZYWmV3dEhIS3lRcGlX?=
 =?utf-8?B?OUZPa3JGc1A4bGYrQ255am95Y2dRT0wrVTBmWkk3WDJCZ1h0RDBJYzBnU1Ft?=
 =?utf-8?B?UGRxZHl5NnpnbjVhdFlySGU3VzZjRit4N05SdzU1Z3NFcnR1cXlIanZhNlRr?=
 =?utf-8?B?cTFjNEF1SXdocVVtMGUzNFpSYzFkeVBlY2NRd3dVT01icFlmZFdZOFdBMk1U?=
 =?utf-8?B?VkJnaTd3bVRjYmpJNVhVTEFhSDl2b0p4V3ZBTUtJcDNKc0tYenF3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451cf756-f602-4e1d-c810-08df33e5713d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 04:47:45.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9YuoCgaZImk4Z1ARDQsZv7asjf6olb1gv261rdDg4QgIFKp2M3X3Qq+B5smKO1HcuVUouNUKzU06rKuiwTGvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9839



On 10/26/26 15:18, sashiko-bot@kernel.org wrote:
> [You don't often get email from sashiko-bot@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] soundwire: amd: race and UAF in sdw_amd_probe() error cleanup with active IRQ
> --
>
> commit 60bd17e72e211d96b5525ff2d9fb05330bb627b0
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix ctx leak when sdw_amd_startup() fails
>
> This commit cleans up the SoundWire context and registered platform devices via
> sdw_amd_exit() and clears *sdw_ctx if sdw_amd_startup() fails during
> sdw_amd_probe().
>
>> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
>> index 8e419ddfa5161..88004d59322ee 100644
>> --- a/drivers/soundwire/amd_init.c
>> +++ b/drivers/soundwire/amd_init.c
>> @@ -166,11 +166,18 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
>>
>>   int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
>>   {
>> +     int ret;
>> +
>>        *sdw_ctx = sdw_amd_probe_controller(res);
>>        if (!*sdw_ctx)
>>                return -ENODEV;
>>
>> -     return sdw_amd_startup(*sdw_ctx);
>> +     ret = sdw_amd_startup(*sdw_ctx);
>> +     if (ret) {
>> +             sdw_amd_exit(*sdw_ctx);
>> +             *sdw_ctx = NULL;
>> +     }
> [Severity: High]
> Could calling sdw_amd_exit(*sdw_ctx) before clearing *sdw_ctx race with the
> parent ACP interrupt handler and trigger a use-after-free?
++

SoundWire IRQs are only enabled inside amd_sdw_manager_start()
during sdw_amd_startup() via amd_enable_sdw_interrupts(). The
platform device probe (amd_sdw_manager_probe()) does not enable
any SoundWire interrupts — it only initializes data structures
and work items. So the ACP_SDW0_STAT / ACP_SDW1_STAT bits in
ACP_EXTERNAL_INTR_STAT cannot be set before sdw_amd_startup()
runs, and the IRQ handler will not reach the adata->sdw
dereference during sdw_amd_probe_controller().

On the failure path, sdw_amd_exit() -> sdw_amd_cleanup() ->
platform_device_unregister() triggers amd_sdw_manager_remove(),
which calls amd_disable_sdw_interrupts() followed by
cancel_work_sync() before freeing amd_manager. So any interrupt
enabled for a partially-started manager is masked before the
manager is freed.

That said, as a defensive improvement, NULL guards on adata->sdw
will be added to acp63_irq_handler() and acp_irq_handler()
before dereferencing adata->sdw->pdev[i].
>
> The callers of sdw_amd_probe() (snd_acp63_probe() ->
> create_acp63_platform_devs() -> amd_sdw_probe() in sound/soc/amd/ps/pci-ps.c,
> and amd_sof_acp_probe() / amd_sof_acp7x_probe() -> amd_sof_sdw_probe() in
> sound/soc/sof/amd/acp.c) enable ACP external interrupts and register their
> shared hard IRQ handlers (acp63_irq_handler(), acp_irq_handler(), and
> acp7x_irq_handler()) before passing &adata->sdw as sdw_ctx to sdw_amd_probe().
The ACP external IRQ handler (acp63_irq_handler) is registered
before sdw_amd_probe() is called. However, SoundWire-specific
status bits (ACP_SDW0_STAT, ACP_SDW1_STAT) in
ACP_EXTERNAL_INTR_STAT are only set when the SoundWire manager
is active on the bus. These bits cannot be asserted before
amd_enable_sdw_interrupts() runs inside amd_sdw_manager_start()
during sdw_amd_startup(). So the adata->sdw->pdev[i] dereference
path in the IRQ handler is not reachable before that point,
regardless of whether adata->sdw is NULL or non-NULL.
>
> In sdw_amd_probe(), *sdw_ctx (adata->sdw) is assigned immediately before
> sdw_amd_startup() runs. Inside sdw_amd_startup() -> amd_sdw_manager_start() in
> drivers/soundwire/amd_manager.c, interrupts are unmasked before the fallible
> manager enable step and before subsequent manager instances in the loop are
> started:
>
> drivers/soundwire/amd_manager.c:amd_sdw_manager_start() {
>      ...
>                  amd_enable_sdw_interrupts(amd_manager);
>                  ret = amd_enable_sdw_manager(amd_manager);
>                  if (ret)
>                          return ret;
>      ...
> }
>
> If amd_enable_sdw_manager() fails, or if manager 0 starts and manager 1 fails
> in amd_sdw_manager_start(), sdw_amd_probe() calls sdw_amd_exit(*sdw_ctx) while
> the parent PCI IRQ is active and *sdw_ctx (adata->sdw) is still non-NULL:
>
> drivers/soundwire/amd_init.c:sdw_amd_exit() {
>          sdw_amd_cleanup(ctx);
>          kfree(ctx->peripherals);
>          kfree(ctx);
> }
Since SoundWire IRQs are not enabled until amd_sdw_manager_start()
runs inside sdw_amd_startup(), the window between *sdw_ctx being
set and startup beginning is safe — the IRQ handler cannot reach
the SDW processing path before that point.

If amd_enable_sdw_manager() fails after amd_enable_sdw_interrupts(),
the failure path calls sdw_amd_exit() -> sdw_amd_cleanup() ->
platform_device_unregister(), which triggers
amd_sdw_manager_remove(). That function calls
amd_disable_sdw_interrupts() before cancel_work_sync() and before
freeing amd_manager. So the interrupt is masked and all work
drained before teardown — no use-after-free can occur on this
path.

As a defensive improvement, a separate follow-up fix will update
sdw_amd_probe() to hold ctx in a local variable and only publish
*sdw_ctx after sdw_amd_startup() succeeds, making the lifetime
contract explicit and removing any ambiguity about pointer
visibility during the startup failure window.
>
> Because sdw_amd_cleanup() unregisters and frees ctx->pdev[i] (and its devres
> amd_manager) and kfree(ctx) frees the context before *sdw_ctx is set to NULL, a
> concurrent hard IRQ handler on another CPU can observe the non-NULL adata->sdw
> pointer and dereference freed ctx or ctx->pdev[i]->dev, or schedule
> amd_sdw_irq_thread after amd_sdw_manager_remove() has already canceled the work
> and freed amd_manager:
>
> sound/soc/sof/amd/acp.c:acp7x_irq_handler() {
>      ...
>          if (adata->sdw) {
>                  for (instance = 0; instance < ACP7X_SDW_MAX_MANAGER_COUNT; instance++) {
>                          if (ext_intr_stat & acp7x_sof_sdw_ext_stat[instance]) {
>                                  sof_acp7x_handle_sdw_manager_irq(sdev, adata, desc, instance,
>                                                                   acp7x_sof_sdw_ext_stat[instance]);
>                                  irq_flag = 1;
>                          }
>                  }
>          }
>      ...
> }
>
> sound/soc/amd/ps/pci-ps.c:acp63_irq_handler() {
>      ...
>          if (ext_intr_stat & ACP_SDW0_STAT) {
>                  writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>                  amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>                  if (amd_manager)
>                          schedule_work(&amd_manager->amd_sdw_irq_thread);
>                  irq_flag = 1;
>          }
>      ...
> }
Will address this missing NULL guard check for adata->sdw  as a follow 
up fix.
>
> Unlike the normal remove paths (which call free_irq() before sdw_amd_exit()),
> the IRQ remains active here. Should sdw_amd_probe() hold ctx in a local
> variable and only publish *sdw_ctx after sdw_amd_startup() succeeds, while also
> ensuring any interrupts enabled during a partial sdw_amd_startup() are masked
> and synchronized before sdw_amd_exit() frees the devices and context?
As mentioned above, Both points will be addressed:

1. sdw_amd_probe() will be updated to delay *sdw_ctx publication
    until after sdw_amd_startup() succeeds, as a defensive
    improvement making the lifetime contract explicit.

2. Interrupt masking before teardown is already handled by
    amd_sdw_manager_remove() (called via platform_device_unregister
    inside sdw_amd_cleanup()), which masks SoundWire interrupts
    via amd_disable_sdw_interrupts() and drains work via
    cancel_work_sync() before freeing amd_manager. No additional
    masking step is needed in sdw_amd_probe()'s error path.

3. NULL guards on adata->sdw will be added to
    acp63_irq_handler() and acp_irq_handler() for both SDW0 and
    SDW1 dereference sites as a defensive fix.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261026044507.2310694-1-Vijendar.Mukunda@amd.com?part=7

