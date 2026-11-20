Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156284;
	b=h7fJVMILUnAJyOWZmzP2DLz6RHNz1glNdu49gHZql7Qp2F2lswWe32o0Ks3j4wsNUuOR
	 cnW2BKoG+5LKnbMuT0inhnGxCvCnlJg5zuplgu1dP2PtfiFSt7qXyxpTu76cwD/j8MQ7Z
	 t4CIDLk2fsOcpZDLhZ3PiqNEHTomedO72/pY5h0fxe2OXnFXMOz57oCMD/Us4XTbeYEvI
	 ur+jbS8UIh96+DjknSXOCdOUVDvV0tJCWF5zO4x01/EWXSImlkigyv3LvVvXIMVB06c9h
	 9m5ATCNM3iTYWhtLIlcqS/EueJcemhCSsRerF2vXcgtD+TLBRtu2YlgeWX0uYVz/s6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156284;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=Se2/wt6Sp80zX0Prjld175a//s1Acp30vZrXQ3K6VCk=;
	b=1U/xCPmBD3k+9BoyGVCAxK4l6MmGCu+B4+9B9e0bms5BIci17S9H6XhtvJ0Ge3msDiY9
	 PYDCv1a2bk7JL15sove8Iz/v4DspNhLzyiTKLIdpu1JonqBj2XfCQ7Z8Q0bsCTWVzi67W
	 w2shM0X0wLsWHYjaf+I4sMcuwHsOEm2/l7NknKDnFxLMqhOWoviXUXbSNo23Dg0/oAK0c
	 5UY2XEy7SHNZt/cmVfeURHgAJPGw5SpCypVIPss0hLcOTTrBANOuTHijvmif/BlT4atiy
	 idqAM2ZRt9t95DCIzcAQjYH2qF7OLXrK0rknr3VP+TQ29YU3uLC0KmQznqNGWGO6+XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3CD2bE2E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.56
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105AB606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 06:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 105AB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3CD2bE2E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfC/Z084vAJQ3ez9wwDELA3L9xuPUWBe8Krsx5aw3Wq4k13tRgAPRnJQNitDlm3IoUH3GV3okHj6KGAbac88FZYXPuBz2A/PBdwGDvyaSF5+tJxX+v3sJmtmTxSH1o/mmdZj1ewIVKeXitWS09HfWPWBBXR5aWmmacxJKX73khnxKjraESKComKqNIMigafq5q2kBFEdmH1RMWnDQxA+4IRxpYAbjJYhc3pZcIShyaBcCLUX+qmr+H2FfEXafMoc62Chx9C/rSUE8d/3n+Nn9rXkFHw0f9fXzDQogmoKMl1N7erCOeL+ACAlhtUVLvlRKRd+zg+mmVbp51xnpltPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Se2/wt6Sp80zX0Prjld175a//s1Acp30vZrXQ3K6VCk=;
 b=EaCkTz1Apes8iZpRFfQTBIBKdIdozARh+63P/dUh5IkwrSArmFmwGwp1EdZMXvJxB63+Jkhjp8r4s7TxIIXZRdE+lgrayb4tAl46EwpB0ciK7iUDZP/4aoa/1Y86Vos41gmjm+bmFUqk/qwJCDd7gJe3wSa7zmTgdambrv8jUpo0pzG14fvddrfAkJvrpvncvawBawu94PysoRwDHagjBxaTbQT0P+l/0DoCq8Q1Er8Q0UKX5aJz8jkoUUkPLbtz/z5rlx5zA6rmG72X4DYg3s+/AZjrS3YKSJfHCu94J1xEhzS9I6Z5ufFpsNPe7RcZmjzZoaNdNrubhsDVZmhtCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se2/wt6Sp80zX0Prjld175a//s1Acp30vZrXQ3K6VCk=;
 b=3CD2bE2Ei32KuKd7zfMTe2QQDIPnhXddgE9BAvov/bUzUf8eOUOURrzQ3zEkM3Bmu3Z9m/WknrFJbfkfRoLE6aN/A9fvLyzUAf1i4tPDACnjDpLXMc/0/QLJcI1WjSJwgYk5O5FCd+ueGC11Z7ZKnqXApGItkzuSb56QTpX571M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by PH5PR12MB092088.namprd12.prod.outlook.com (2603:10b6:510:500::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Fri, 20 Nov
 2026 06:31:20 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 06:31:20 +0000
Message-ID: <c444aa51-07e7-44f2-88fc-78219dcc77a2@amd.com>
Date: Fri, 20 Nov 2026 12:04:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/23] soundwire: amd: use interrupt_enabled flag to
 guard IRQ work scheduling
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, "vkoul@kernel.org" <vkoul@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20261118104353.331556-1-Vijendar.Mukunda@amd.com>
 <20261118104353.331556-16-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-220814@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-220814@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::8) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|PH5PR12MB092088:EE_
X-MS-Office365-Filtering-Correlation-Id: c65a14b5-5cd5-4254-4943-08df46cfe3a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026121527099003|18002099003|22082099003|6133799003|261022105027099003|261021123027099003|11063799006|4143699003|56012099006|261028144727099003|261102123227099003|261022075727099003|10067099003|261021121427099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	4xE/vs6DQnDTHisos1+wqd04DXye0Lm0nUUfDswb9paVckca6CsH5MTvDZsHzgnFn+RoLiEmPRT6+RDlwpAfIMG7zUR5nz+OxbjTY0awZ+tjRldexFmVGYbWXweDGenaCUQrjLfy7Js4ytMzb+s+big3e95UkIcXzmNngrNAjGhmwfxMFja8PK1S9HIf5BFGxhNGH2pAJiMo9pBmWWIqqo8KjaBye3uej8Q6ZR6ogOsrgUMnU7AEVvSH7bwr2ROnegBfC0q6SMJ689hgmsQG0NcpiQCwONbTDzfe2M2q7UMiwa+7jaZ2gHqzBt1q8PfVTkn8GR6WsB0H5Dmm4tli7n3hAy/eeeQqYhGcdRMv8bmwAMS9WMicaaKifJveNZ9SIy3fKX8l+0Cq5GfdPc163OfGKDuun2qvq4jKi4mVR1ouTyd39Q/kV0iuwwSPlm9/jV32iiDuC73xPsv5ff0nHo1qi9IRn5/64eIVjCyTElqJ5xwnI1HZT5CuNo/0e6ChY8ZLA0Ng6TNSTa2l203NUlu7V5+zWRc3krKG7NGhesNcvwru9pSXoCWyoBATv/j+Fsxq4kGCxiesMXk7FLgibA0QyS1LjIG1rwLC0IdUgj6YKiu9I79ZpLpQWfuEe6CJFVg87AFzfqMI+GyNhEWGfEQaqRIbpIWm7D7WGRBaE58=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026121527099003)(18002099003)(22082099003)(6133799003)(261022105027099003)(261021123027099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261102123227099003)(261022075727099003)(10067099003)(261021121427099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTkyOHE3Z1BYdk1CTGJuYjZuTTVqQ2lsaFVkdlJDbnM5UlBDc1N5VmlvYWU0?=
 =?utf-8?B?d01uallwTTgwd3pRVWRBbEQrSTJYTWxPNEE1QlFsVmp3ajY1T2hYQU1Cdndr?=
 =?utf-8?B?R1ZhRmhaaG5KWTRTcjA3TTdyZ1M4Unp0ajNaSi9pOG93MmFiRU9zeHFtalpw?=
 =?utf-8?B?RlUwbGVIUjRzVTViNkVXbkl3Lyt1YjdDcTdLTjBwUVkxanFzMFB4STRaSkdu?=
 =?utf-8?B?L01JWlZ2YnJCODNjQ3JraVRyMzR4UmZrZjA1WnI5cWRsdVRvV2U4bmtvWUZJ?=
 =?utf-8?B?eE41bzQvMU5DaTRGM1JxcTEySVM5b0JBT2FwT2FHTWY5cmxDQ0gxRzVkNnZY?=
 =?utf-8?B?Y1dSQlpDcVFNakpIQldkSTgvdU1HRlpOekRFWit4TWJiUXd5aFl4dmQxaktM?=
 =?utf-8?B?bjc1eE1vTWZ4MDVzTVBDZFFodlhUNVhFaXhZZTg2eHdyazJIMjNtWnUvejlR?=
 =?utf-8?B?enpEVHVYalZGU1NJaUpLbHBVdE5OVU5KNE9UM1YwdWJ5cUJqaTR0bFVETTI1?=
 =?utf-8?B?Lzd6NE56SXk2SnVJcDU5MGh6eEFuZ1krSHdtRTQvM0RnV0VSUGZkOWt6NkFq?=
 =?utf-8?B?clVoaHFwTU11RU80aysyMGNJM3hQOWtVWVZva0VUdlVDUFhMNmUzdWRLNFl1?=
 =?utf-8?B?YkJlSnNwT21XZXl5WkJpTGdvem1tVmJUOHdJMkFrQTVjZDhPZlY5b292N1px?=
 =?utf-8?B?YUhpQllIUnRxZWZxTHRVMnBOeXlNSFNUU0ozMzRkU1RRZjdXNGJacElRUjJy?=
 =?utf-8?B?NGNQYzNET1hiNnBrTG5ucHVna2p5U0k1ZGY4RHpWVENPVy9kTWsrYUh1SWtF?=
 =?utf-8?B?SldsNEtUWWNMeXQrRHg4dVlyV1Jlb0VFb0lKSGMyT0VwT2piYmVDOUYwcWpi?=
 =?utf-8?B?aDI0eGdOdnNKMUNwbW15eG1lNzFVSXE3WlQraXpRUy85QlNTdFRPNS9kQzBL?=
 =?utf-8?B?ODJkNGwzdjVqWktvVnh6Rks4QWFDMGdxTGRTSVlVdU0zajFpc3lTcFRWdjhn?=
 =?utf-8?B?dzFodVlrT2R5dVA0d3V3a2kxd1lDYlVpMU9INjNkVXNTTXhadW5QbitFSGY1?=
 =?utf-8?B?TjE0Yi9yUUl1Tm1IRG1SdGpzM0thOFNyTCtKa1MrSlNHczhRQTlaSXBIU1Nm?=
 =?utf-8?B?bDQ5a29qMlc4ZThPRzNaV0Q2Smd2bTUxcVVIdnZkMHpnTGZjUUZTajY0RHB0?=
 =?utf-8?B?aW1Sdi9vSDNYTGoxUi9oNXpjZng4MjVaa1JUMktHN1BDUUNkLzc5NEIxekQv?=
 =?utf-8?B?bW5JanlXUk5oMjdqbUxjODdGa2w0UVJNRkFmZHBVRDArQ2JPZ2FzY1dLNEs2?=
 =?utf-8?B?RG5NVy8xdDdkS3pPTjRBdU93TmZxclNaQUdSNVRRdU12M1JjSTJoYmtnRHB0?=
 =?utf-8?B?NUgzeGJFTEZ4M090a3dDcSt0NXB0WjNKUmxDS0VrUktSVG02bTNMK3RUSjhK?=
 =?utf-8?B?WERHTjF5SEEyaE5PREFNNUxsemwyTGRRUUQ3aWR2RzN2VWVrSHBjQ3hxanlr?=
 =?utf-8?B?WTA4bXZMb3l4bks0eEovWGhCa1dUZEFIdkZSUlZMUllZRzU5MnFtaFpTTjYw?=
 =?utf-8?B?cW1nRkZwL0l4bDF4cGRsdnNRcFNsanRYYitQUkZMazBURVlRcnArTWRMdGlX?=
 =?utf-8?B?dEtRQmtSelphYmpIekIwOGo2M1N0N3ZHSjJBQWl6SkU0TXRYRHl0QjhqTXdp?=
 =?utf-8?B?VHlVdjcyeVdJZy9RQzhIU1BJU0t5ZUJVNGxscXRUZ29iRmowRlRhazkyakRI?=
 =?utf-8?B?UnRIa0hDM25JcXcwdG50NS8xVHFidDZ3d1JJTHh3Y1ZOVW1qNVdUekVHMzhr?=
 =?utf-8?B?RUNINXlBc0hxWFloQWxFTFlkUmVLbDhlS3lUck82RzBieEJTaHFHblNaTHRn?=
 =?utf-8?B?MVV4QW1Ob01iOHdsNkVDMnB1dTBqcitGUlhsRmpXUnJHTzM4TWRaRUJNd0dx?=
 =?utf-8?B?OTZURk1WU0hzenBmaDFjWlZaS2ZEWUNqT01MSjhNaDdacjE2a2ZSRmNYMzhL?=
 =?utf-8?B?WWxRcVg0OWNWU3dlNG1xWmhCUGJFbEwvV0lHNFlqd2dEZGU1UWRiUnhjdHZX?=
 =?utf-8?B?UkpOL3NSbDBvVGpZUzl1ZVliekhoRUlONVpMamxuU1NWdjhmRXh4OGp6dXdv?=
 =?utf-8?B?N09oT0YzK1ZaTEFsejhIWGMrM0xNVm9KNzRXQkdjZksxQ1NRbmtWd1JkRWdm?=
 =?utf-8?B?Zzl5WTdnbjl2Qmd3REJTNmtld1dzQy9SeTlvblh3YWRiUlRzU0lSMHhhM3pu?=
 =?utf-8?B?SGN4b1VMQkhMYldiWXVqOXBJdFY1aXFsWHlwcmtpc3JyUko3cmxRTEo5bk00?=
 =?utf-8?B?RDhQV2prVUNORXcwNmNJWFd2MDBsOXBmZjltSUo4cTNhM042NUx6QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65a14b5-5cd5-4254-4943-08df46cfe3a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:31:20.4774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nX8rc2CQsiTB4NWrXQdoHOvdRiGKEiEyMugYNzgPgCg/iJ+XqISuGnmMtUvUeglhXLi3AlADdyL6Ew6IEaabHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB092088

On 18/11/26 16:46, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] soundwire: amd: uncleared status registers on
>   amd_sdw_irq_thread() early return
> - [Medium] soundwire: amd: race re-enabling IRQ masks in
>   amd_disable_sdw_interrupts()
> --
>
> commit 269c03a96e80686f35053a07e902e710a24e59b0
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: use interrupt_enabled flag to guard IRQ work scheduling
>
> This commit adds an interrupt_enabled flag to struct amd_sdw_manager to
> prevent queued amd_sdw_irq_thread() work from running after interrupt
> disabling begins, and restores the flag when re-arming wake interrupts on
> ACP6.3 during runtime suspend.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index f3e9614b9ac82..5536a4fd137aa 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
> [ ... ]
>> @@ -135,6 +136,18 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
>>  {
>>  	u32 irq_mask;
>>  
>> +	/*
>> +	 * Clear the flag before updating hardware masks. Work items already
>> +	 * queued but not yet started will see the flag false at entry and
>> +	 * return early; work items already running will complete their current
>> +	 * invocation. Callers that need to ensure no instance of
>> +	 * amd_sdw_irq_thread() is executing on return must follow this call
>> +	 * with cancel_work_sync(&amd_manager->amd_sdw_irq_thread). Once the
>> +	 * mask registers are written, the ACP hardware will not assert any new
>> +	 * SDW interrupt.
>> +	 */
>> +	WRITE_ONCE(amd_manager->interrupt_enabled, false);
>> +
>>  	mutex_lock(amd_manager->acp_sdw_lock);
>>  	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
>>  	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
> [Severity: Medium]
> Can an in-flight amd_sdw_update_slave_status_work() overwrite the zeroed
> ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and
> ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11 registers after
> amd_disable_sdw_interrupts() returns?
No change required. ACP_EXTERNAL_INTR_CNTL is the top-level delivery
gate for all SDW interrupts on this hardware. amd_disable_sdw_interrupts()
clears the manager's bit in ACP_EXTERNAL_INTR_CNTL before returning.
An in-flight amd_sdw_update_slave_status_work() on the SDW_SLAVE_ATTACHED
path may re-write ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7 and _MASK_8TO11
after amd_disable_sdw_interrupts() returns, but that work never touches
ACP_EXTERNAL_INTR_CNTL. The top-level gate remains closed, so no
interrupt can reach the CPU regardless of what the per-instance mask
registers contain at that point.
>
> CPU0                                  CPU1 (kworker)
> amd_suspend_runtime()
>   ...
>   amd_disable_sdw_interrupts()
>     WRITE_ONCE(interrupt_enabled,
>                false)
>     writel(0, ..._MASK_0TO7)
>     writel(0, ..._MASK_8TO11)
>                                       amd_sdw_update_slave_status_work()
>                                         sdw_handle_slave_status()
>                                         writel(AMD_SDW_IRQ_MASK_0TO7,
>                                                ..._MASK_0TO7)
>                                         writel(AMD_SDW_IRQ_MASK_8TO11,
>                                                ..._MASK_8TO11)
>   amd_sdw_wake_enable(..., true)
>   WRITE_ONCE(interrupt_enabled, true)
>   amd_updatel(...,
>               ACP_EXTERNAL_INTR_CNTL,
>               val, val)  <-- non-wake state-change IRQs left unmasked
>
> Unlike sdw_cdns_enable_interrupt(), amd_disable_sdw_interrupts() zeroes
> the mask registers before callers drain amd_manager->amd_sdw_work with
> cancel_work_sync() (including after commit "soundwire: amd: fix interrupt
> gate and work drain ordering in PM ops"), and
> amd_sdw_update_slave_status_work() restores AMD_SDW_IRQ_MASK_0TO7 and
> AMD_SDW_IRQ_MASK_8TO11 without checking interrupt_enabled:
>
> drivers/soundwire/amd_manager.c:amd_sdw_update_slave_status_work() {
> 	...
> 	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
> 		if (retry_count++ < SDW_MAX_DEVICES) {
> 			writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
> 			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> 			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
> 			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> 	...
> }
>
> In AMD_SDW_POWER_OFF_MODE runtime suspend, amd_sdw_wake_enable() then
> performs a read-modify-write on ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11
> that preserves those re-enabled mask bits, and on ACP6.3 with
> wake_en_mask set, amd_suspend_runtime() sets interrupt_enabled back to
> true and re-opens ACP_EXTERNAL_INTR_CNTL, leaving non-wake state-change
> interrupts unmasked and deliverable while the manager is suspended.
>
>> @@ -1111,6 +1124,9 @@ static void amd_sdw_irq_thread(struct work_struct *work)
>>  	u32 status_change_8to11;
>>  	u32 status_change_0to7;
>>  
>> +	if (!READ_ONCE(amd_manager->interrupt_enabled))
>> +		return;
>> +
>>  	status_change_8to11 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
>>  	status_change_0to7 = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
>>  	if (!status_change_0to7 && !status_change_8to11)
> [Severity: Medium]
> Does returning early here leave ACP_SW_STATE_CHANGE_STATUS_8TO11 and
> ACP_SW_STATE_CHANGE_STATUS_0TO7 latched in hardware across runtime
> suspend?

Valid concern. Will fix in v8 by clearing the STATUS registers in
two places before interrupt delivery is re-enabled:

 1. At the start of amd_enable_sdw_interrupts(), before setting
   interrupt_enabled = true and writing the mask registers, so that
   stale pre-suspend STATUS bits do not trigger spurious processing
   when CLK_STOP_MODE re-enables interrupt delivery after clock
   stop. After amd_sdw_clock_stop() completes the hardware cannot
   assert new STATUS bits, so the clear loses no real events:

     writel(0x00, amd_manager->mmio +
                  ACP_SW_STATE_CHANGE_STATUS_8TO11);
     writel(0x00, amd_manager->mmio +
                  ACP_SW_STATE_CHANGE_STATUS_0TO7);
     WRITE_ONCE(amd_manager->interrupt_enabled, true);

2. In the ACP6.3 POWER_OFF_MODE wake-re-enable block in
   amd_suspend_runtime(), before WRITE_ONCE(interrupt_enabled,
   true), so that a wake interrupt arriving after re-arm does not
   cause amd_sdw_irq_thread() to process pre-suspend state-change
   or PREQ bits while the manager is still disabled:

      writel(0x00, amd_manager->mmio +
                  ACP_SW_STATE_CHANGE_STATUS_8TO11);
     writel(0x00, amd_manager->mmio +
                  ACP_SW_STATE_CHANGE_STATUS_0TO7);
     WRITE_ONCE(amd_manager->interrupt_enabled, true);

>
> When a SoundWire interrupt fires shortly before
> amd_disable_sdw_interrupts(), the hardirq handler clears
> ACP_EXTERNAL_INTR_STAT and queues amd_sdw_irq_thread, leaving the status
> bits latched in ACP_SW_STATE_CHANGE_STATUS_8TO11 and
> ACP_SW_STATE_CHANGE_STATUS_0TO7 until the end of amd_sdw_irq_thread().
> Because neither amd_disable_sdw_interrupts() nor this early return clears
> those status registers (even after commit "soundwire: amd: fix interrupt
> gate and work drain ordering in PM ops" drains the workqueues), the
> pre-suspend status bits remain set when amd_suspend_runtime() restores
> interrupt_enabled to true on ACP6.3 in AMD_SDW_POWER_OFF_MODE.
>
> When a wake interrupt later arrives, amd_sdw_irq_thread() reads the stale
> PREQ or state-change bits alongside AMD_SDW_WAKE_STAT_MASK, calls
> asynchronous pm_request_resume() in amd_sdw_process_wake_event(), clears
> only AMD_SDW_WAKE_STAT_MASK, and falls through to
> amd_sdw_read_and_process_ping_status() or amd_sdw_update_slave_status()
> and schedule_work(&amd_manager->amd_sdw_work) while the manager is still
> disabled and clock-stopped.
>

