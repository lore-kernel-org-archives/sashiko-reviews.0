Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793022427;
	b=YGhz+lplmPjtZLfBevkwq+sqf+bAJsSeXiVWt3IuR17AzSIFe/Sis2d0G+pnBOXNyw0p
	 1E9Nh6Z15eBxLdwc1lCgDpgd3elj6kBJu/G4rJQwhzm9GYEbG4x7Hvz8QAcG7lBQa+rHG
	 ACR7Yt4mGw3GHbNHQ+q2ZbaJ57Nvue5XN0hH25y0dV4iONJoHjAVWN7Gsu2aQoZpdMV8z
	 NVE6836X73kJoMKTwql/YwqNAuTaliFpg+iUuu7imDG225fZJDnEVu3shMOPX+nIshUKn
	 DUU/o/uXpP0kPcwUMQSXRCM5vHUFrgzpPqBGkPhGWnWxOxE/Nx7vLrMRcfU92ycC9qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022427;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
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
	bh=xZw7U6r5jlg4pUGlWC1zQV7xRrgBaR+VnkioQamESDk=;
	b=rCzJa0n1Z55QC3grI/BbB1QSXJJuiHnbwVWhRUhJEy3FMeCg5elEknZ4JMhF74scpztA
	 u8f9GdHukreBfHULv1xSPDaLjt0MimHjxOTJGgGtl0hJzDliHJnPVvduIb8hANw+698yc
	 Iboo4k0to8B9TGANN+8TOMy7AR4NEfHQUWbhjGAH9sNEUsyYo1dTl6AtOOLh4AskIkqyN
	 GzBAS+xmCdC7+45y75OVbusFfSW4f+ETBxXmEHif5DCFqnLkmgA0wTdtGHSmHW0MLJMMN
	 X7Txx2k65oaGeGV8wp7zgHBD6BWq5bRcDKW1WLZXohmkK4a4fTLxOVoGkgv1Qhv/iSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=adqQFqOS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.10
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B23460A2605
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 13:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B23460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=adqQFqOS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YliZYl7mdIvkmcmNZlcUqiqA1IxgQ07fFBkOH4S5nJqnEuU6jLze3AY1/d9oerDzp7TtRXoYnVOplaqUe+051BzOcCkmdstfGeDYJdQqXOl4dgF4PrhIr7t/fd8pmolWCeHI2yOGG5E0YwuY7Xis7E8Phjl+rMEa5pTmtxNEn/l+/0einJh7Ko3K3c5KlF+5DJbO+gi192lMKGqFeM/H9jcbDVR5TjAmWu7MxuHsQsXTRQzPccL/6VYIm6inGG07W2UK7wfuCRdGTQaSgqQevZVfjtnJqCCG4V6Xv6as9YFkuzqNoZwfJpke9lQjqaImOkSE1V/keDkepKUohWQE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZw7U6r5jlg4pUGlWC1zQV7xRrgBaR+VnkioQamESDk=;
 b=cfU9r4Igzk941dkP6HZv5pMUK1P+uTG/ylz2XBRZcx6J4lFDxj8Gxj10ylGEJw5I4OjAwgLfH/FTAwiNla0mIpwxnAS35sV8XZj9SY7aHd4E8ssjMwmWb9rI8fL1Znsq6mxguS6y4a6O2CeF4CYxbb/nAWOMA3mBdahZFjLIL17xKEshTTt0BS3ynOCp56v5XyG/1fVCEVz46U4tbSbIfe3UAN767SCTbbDwigukg9j5/ezgPvOoc59jPhdwdephv5iLMyHa8HAHGIZf0tGvZqEINdWx92EWelW5QYfvmfrDz5HROPK6mICwXg6/Tbg24N1sn+sZ4QYEjKbclkKONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZw7U6r5jlg4pUGlWC1zQV7xRrgBaR+VnkioQamESDk=;
 b=adqQFqOSWbUncQZCUaGcow7uPq8CvLN4/aK0CxII1fjtpwHtaHaif1LRzOGuMHDwxcA9MIMrcrt65S+d086GJKwmPgOv/UBdt6HtzSX+/tIfsoaqbaszEX0kqA5PVuUiYJ3NkM47wzH4TVS7T/yhAtqMZv33pzB27/3nC8AYnxs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 13:47:01 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 13:47:01 +0000
Message-ID: <e2d6b65a-9125-4938-a2b4-5ba032f1ec88@amd.com>
Date: Mon, 26 Oct 2026 19:15:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] soundwire: amd: return response on IMM status
 cleanup timeout
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Syed Saba Kareem <syed.sabakareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 "N, Poojitha" <Poojitha.N@amd.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>, Vinod Koul
 <vkoul@kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-3-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-184738@kernel.org>
 <b9a63395-16f0-46ee-9208-19b3b28d876c@amd.com>
Content-Language: en-US
In-Reply-To: <b9a63395-16f0-46ee-9208-19b3b28d876c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::10) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|MW5PR12MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 70444dbd-4327-4df1-0c61-08df33679c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261021123027099003|11063799006|4143699003|56012099006|261009223027099003|261022075727099003|261022105027099003|261021121427099003|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kTvc+1yYj4WgloLk2pRNPf7N6Ae26S+he5OO1QcBxv2h6dChShuwJWOyDnevK9+oisgCazHdlAb15sbJZUnMA5x8sF5uJvtrlAm93MMK4szt+/LjA7vlKL+tHKAedpq04NOvsts3dX6xkZKstJQEtKLUywbvI0pGwGgiJxL3GsaD41DCYW0sT8yrUnh//k0VTYX8BaPOn4A5H0ekpcXP6pTEJAlZlUsQ2GQfIoAIuqFTJ3S9cCjsfc1U+bMFkMjUN7BRHiscuIzDZurhl1KWVk4uML06aLy4u5xQYqSTxYm3AmwtTrF8wwdNuJ8OGnbjNP+sJxnv8v1uL3HKnUDMRPlv54K9apBa0KnkcMPDTS+Lyxg/fL+RpCqwQlvei8C3ehA6sYXvTDZdo19nRk2s1qRJUX7upevAGrLG5XFTcrk01y59KGOPfuCFFl7IfFGCV2M8889mbaZh6+ZAJNLbPq5U/rCKCHfi93QXTk3jFHY9IgMNDgLxET1oREmfjDUWBKlN+ND+uEEXjlmZdUFi1kjgJMUs7n9uYWb2GebQs4lY/MyScEZ6rGrBypJZFy2cws2UXRE8CUbyP9PaPG9l4/mAg0KPs/IYC3YnVOxhtlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021123027099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmZXNzdTWitRdmJNa29STjFtWDV1anE0aDNnZERtQmNmWDBHaDRDTWhlNFh1?=
 =?utf-8?B?RlRXWk93Q242Q25ZR2wwRTBDb3VVMjJYSkxsZU1oejRPWXg0S1pmQkVrWlI3?=
 =?utf-8?B?YlZZdDVxWmVNMjlBRVJhMzgrRWpJeDZtZGc3a01qdjlESmtKUXF4VmJTUnA3?=
 =?utf-8?B?Z1pHQkRNbkNsV3czSVBpbVFNWDNlVmtXb0N6Skgrd0FnZ21tUXBNa09aV1Z1?=
 =?utf-8?B?WlhCRXdydTNBdFhjclNjU21VWEp1cFFoL0VHUCtWdEQ1MURBeWt1ZHhDcEJ0?=
 =?utf-8?B?VDNCMW1ySjlWVkRNdVAyS1hmTSsvRmlXNVJoNWZqQVVuNGdGa0Nia2wxNU1E?=
 =?utf-8?B?VTVJTm9yZmt4WnRWUSsrOTJYLzBIYlptTThlays5enBJaWlkL25UWlFkZzFL?=
 =?utf-8?B?Z2tJaWZ6NDVJck45T3AxUTlqbGFLamhiQk1BU2l0dlAzUzIwbDJOT0ZWeFgv?=
 =?utf-8?B?SU0vSTh1SkZJb0RCUEh6QUd2TGsrZWxaeWFMckE2SHI0bEg2Y2gralh2T1c3?=
 =?utf-8?B?ZHFTOUpLSGl2Y2w3TVdpQjRLRXV3cyswSktNSkZDa2xKSE1nc1NFZHM5WE9X?=
 =?utf-8?B?OUlsRVgwR0EvTTRhRkVBV1NyTC9CWTN3aHNvUzl0MTkrdUpad2dEWWo1L2wr?=
 =?utf-8?B?SU5mdWgwZHR1MnpKU3NwWmxIKzN6d2R1VHJrb3dncEtkY29aTHR5VTFvRmRu?=
 =?utf-8?B?N0xYclc3QlAxNlg0SlMwLytrczNxQ0lCWFF3ZjNLbytEWkVqdjZYcVZSdFV4?=
 =?utf-8?B?OVFOQXA1YlhLZkdNY0dPakhnL3pKNFI3TkVRdTN1K2ttQ3g2QXpReVJxUHJi?=
 =?utf-8?B?OHZyMmxNQlQ0bWxJQVpYZk1wUWhEM0swQkFXSDRxMVFuUDErZFdlYlRFS3M3?=
 =?utf-8?B?L090YlFrTjMyYXdmcTNkY1R4RVRjS29ERCtyZmREN0Y2YnRiaFRCMm45TDdZ?=
 =?utf-8?B?MDlhU0JqamdnckNMWjlQeUNqeXIvNmtUMlViT0lEOVIxbTl1Uml5d0NoNnJ0?=
 =?utf-8?B?N3BNMWNWbG9NMnZWZWZPMUowdGpQb0VFNkZObklBczRYSHBQbzk4WEFSTy9O?=
 =?utf-8?B?RWZuN2p6cFBMa3puSkM2cUhiVUhVRW9ZUmFkY1Noakd1YW54d0x0bkhOem1u?=
 =?utf-8?B?WTkwVGtib04zOCtkYTJRcnhTOUJUeGNqVlY4YkduREkrOGVRWWN4UG0xc3Uy?=
 =?utf-8?B?NTFyQzhIWS83b1VLcWhpckJCSHh4ZzJnOUtsZ2lsYStldWRVZkd2N0JQc0NT?=
 =?utf-8?B?WHhGSlBFSFBhOWFRVGlhV2dKdlNERWNrTmZSd0t2MVI0VXY4eTgyeXlCL3Vx?=
 =?utf-8?B?QUcvUTNyM1NWazdRTndnNnJOL254NlRBZUtjR283YmdhT2ZQYkRkOE1ITURD?=
 =?utf-8?B?RHpJL3NVUHl6TEZNNEdON3dLQXd5aC90a2JJRGFnSFRaTDM3UlJyNTR5bEQ5?=
 =?utf-8?B?MFlSUk5uM3I2WGFsTTdkL21uVzd2UlJEakxwd2hCSFlJamxCKytxbmdHeUxF?=
 =?utf-8?B?cTNGektyT1lyQVo3bXR2OFpaRkJZS1Q0SXgvejNjQ3JmWlY0QkNzR25uSlAw?=
 =?utf-8?B?UjVVY1c2L0FlQjhHKzNkRzhOUUN0ckZiMEV3cDNoeVZqOWs0eXhRVWdUUVVT?=
 =?utf-8?B?d2kvOG9kcUdUZVloZW1DMHFmaWNGUXBEcWw5VjBsdnQvYlJzTUNUdVlFSkJW?=
 =?utf-8?B?bjdoOGUxU0dNVUhPK253NGZvYVUxbUxET3k0MU43RGMwR2IySzY1YjdpOFQw?=
 =?utf-8?B?Qk9EZmpVbndhazhSMGZjODB0SjQ0WXNLWW9vRkVrUVZqZmJ1ZjIxNFlCWnp0?=
 =?utf-8?B?bHVtMVJsb2VkSDh3d056OWtnZnpYSFQvUldXY1dQWjU2ZkVBYUJUb3hMSGFO?=
 =?utf-8?B?VjFEbFlIeUhJV2x2bW05NUZYeHFmTTlVWldWSGdwd2F5cUdZVzZ3ZWI0ZWxo?=
 =?utf-8?B?UGYxdk16NE1OL3UwcThWUmZyMlQrRGF5L082Wk1OVWt6eUJLenJPTWE1TmtF?=
 =?utf-8?B?bStIcWFmWTNJdWQ3YWlYV0dtRUpGTkZ1c25tQ1hWbE0xSEE1N0NWd0Z0VG91?=
 =?utf-8?B?VUJNMEszNHFyakFnNHk4dUxhaWtsMDhXbkM3dlpFUldha1FXSmRLWXRsaHlC?=
 =?utf-8?B?aDNEbHY4VHRwSzd0MGxYWEI5cnB0Ky9mOWd1SWVMUENBd0pRMEdhajJDNG10?=
 =?utf-8?B?V2gzRkd0VVhpQ2hHU2lJckJEMllEUXU3OU9Id241K08rNXltOTlBeGNkOStL?=
 =?utf-8?B?cXB3VmNkZTJrSTJVTlBzVGVQcG5DWlRTUzAyRUZFeGl6K0svSENaL1BocWFQ?=
 =?utf-8?B?RlJwbkptZUsxNEtkdzU2U3Fkd1V3Y0JCc2ZocWxvUDNPVGhSQ0xLQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70444dbd-4327-4df1-0c61-08df33679c2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 13:47:00.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnQOIsRZtH8loCLaXMiHcf3nTgouSbUA2neLf09plG88/YTSh5NLSTuxdeQgOWkp5kJ4WLSTT53FXwoo09aVWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683



On 10/26/26 17:43, Mukunda,Vijendar wrote:
>
>
> On 10/26/26 14:38, sashiko-bot@kernel.org wrote:
>> [You don't often get email from sashiko-bot@kernel.org. Learn why 
>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential 
>> issue(s) to consider:
>> - [High] soundwire: amd: unpolled IMM_RES_VALID clear in 
>> amd_sdw_send_cmd_get_resp()
>> -- 
>>
>> commit 3a55a761f23cc08cf1a64f142c04e1aa78cc244d
>> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>>
>> soundwire: amd: return response on IMM status cleanup timeout
>>
>> This commit changes amd_sdw_send_cmd_get_resp() to log an error, 
>> store the
>> read response, and return 0 when polling for AMD_SDW_IMM_RES_VALID to 
>> clear
>> times out. It relies on the bad-state check at the start of the next
>> invocation to clear the remaining AMD_SDW_IMM_RES_VALID bit.
>>
>>> diff --git a/drivers/soundwire/amd_manager.c 
>>> b/drivers/soundwire/amd_manager.c
>>> index 307cbfdb94422..0b83126b5ce6c 100644
>>> --- a/drivers/soundwire/amd_manager.c
>>> +++ b/drivers/soundwire/amd_manager.c
>>> @@ -285,11 +285,9 @@ static int amd_sdw_send_cmd_get_resp(struct 
>>> amd_sdw_manager *amd_manager, u32 lo
>>>        writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + 
>>> ACP_SW_IMM_CMD_STS);
>>>        ret = readl_poll_timeout(amd_manager->mmio + 
>>> ACP_SW_IMM_CMD_STS, sts,
>>>                                 !(sts & AMD_SDW_IMM_RES_VALID), 
>>> ACP_DELAY_US, AMD_SDW_TIMEOUT);
>>> -     if (ret) {
>>> +     if (ret)
>>>                dev_err(amd_manager->dev, "SDW%x cmd status retry 
>>> failed\n",
>>>                        amd_manager->instance);
>>> -             return ret;
>>> -     }
>>>        *response = ((u64)upper_resp << 32) | lower_resp;
>>>        return 0;
>>>   }
>> [Severity: High]
>> When this cleanup poll for !(sts & AMD_SDW_IMM_RES_VALID) times out and
>> amd_sdw_send_cmd_get_resp() in drivers/soundwire/amd_manager.c 
>> returns 0,
>> can back-to-back commands read stale response data from
>> ACP_SW_IMM_RESP_UPPER_WORD and ACP_SW_IMM_RESP_LOWER_QWORD?
++
> No. The response for the current command has already been latched and 
> read
> before the cleanup poll is performed.
>
> The first poll waits for AMD_SDW_IMM_RES_VALID to be set, indicating that
> the response is available. A timeout there is still returned as an error
> and this behavior is unchanged.
>
> The trailing poll only waits for AMD_SDW_IMM_RES_VALID to be cleared 
> after
> the response has been read. Therefore, a timeout during this cleanup does
> not invalidate the response that was already obtained.
>>
>> Callers such as amd_program_scp_addr() and amd_sdw_xfer_msg() issue 
>> multiple
>> commands in sequence:
>>
>> sdw_transfer()
>>    do_transfer()
>>      amd_sdw_xfer_msg()
>>        amd_prep_msg()
>>          amd_program_scp_addr()
>>            amd_sdw_send_cmd_get_resp()
>>        _amd_sdw_xfer_msg()
>>          amd_sdw_send_cmd_get_resp()
>>
>> On the immediate next call to amd_sdw_send_cmd_get_resp(), the bad-state
>> guard writes AMD_SDW_IMM_RES_VALID to ACP_SW_IMM_CMD_STS without 
>> polling for
>> !(sts & AMD_SDW_IMM_RES_VALID) before issuing the next command and 
>> polling
>> for (sts & AMD_SDW_IMM_RES_VALID):
>>
>>          if (sts & AMD_SDW_IMM_RES_VALID) {
>>                  dev_err(amd_manager->dev, "SDW%x manager is in bad 
>> state\n", amd_manager->instance);
>>                  writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + 
>> ACP_SW_IMM_CMD_STS);
>>          }
>>          writel(upper_data, amd_manager->mmio + 
>> ACP_SW_IMM_CMD_UPPER_WORD);
>>          writel(lower_data, amd_manager->mmio + 
>> ACP_SW_IMM_CMD_LOWER_QWORD);
>>
>>          ret = readl_poll_timeout(amd_manager->mmio + 
>> ACP_SW_IMM_CMD_STS, sts,
>>                                   (sts & AMD_SDW_IMM_RES_VALID), 
>> ACP_DELAY_US, AMD_SDW_TIMEOUT);
>>
>> Because clearing AMD_SDW_IMM_RES_VALID requires an asynchronous hardware
>> handshake that already failed to complete within AMD_SDW_TIMEOUT on the
>> previous command, won't AMD_SDW_IMM_RES_VALID still be set when
>> readl_poll_timeout() immediately checks (sts & AMD_SDW_IMM_RES_VALID),
>> causing it to succeed on the stale bit and read the previous command's
>> response registers? Should the bad-state guard also poll until
>> !(sts & AMD_SDW_IMM_RES_VALID) before writing the new command words?
> No. If AMD_SDW_IMM_RES_VALID is still set on the next invocation, the
> bad-state path clears it by writing AMD_SDW_IMM_RES_VALID to
> ACP_SW_IMM_CMD_STS before programming the next command.
>
> This behavior is also consistent with the hardware reference
> implementation, where the bad-state path uses the same write-1-to-clear
> sequence without polling again for the status bit to clear.
> Therefore, no additional change is required for this scenario.
>
>>
>> -- 
>> Sashiko AI review · 
>> https://sashiko.dev/#/patchset/20261026044507.2310694-1-Vijendar.Mukunda@amd.com?part=2
>

