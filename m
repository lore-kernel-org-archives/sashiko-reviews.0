Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793072974;
	b=nLifWuyd2uLjfqSgjIp0QguG8bbJA1dNDVUy7ky3G4d9SBv6QUlFgU48Ew2ZppSfE2P2
	 K8O9AxCs9ft5ICASSrUJjUMF++8RGGbJEfJ5HEZtpYiMvbTPunqo+vVEXP67ETAKNXLXj
	 qDlqNI02CQ6q5PM3pdU/Cn7kUIBm3Sk+T3OwjUub9m0D2vShc3jKPfYyjRTDKNCOtMYcw
	 Uwjl+0Pu/OLDNWwxjG2ieWLBMmKp3rIx+pY1iC7WPTYH6tZoGUmygRHC8YhZegH/KIdbj
	 Rd6YqU+ddYB6Cbt36muXXir798LRq4gkE4yWnj1LEOIk6Y8fcn5t/CiKndOhl517H5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072974;
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
	bh=WQ7Ae3MY36o0o9qAXtor2dD3d0Ah+wXHX51EIYrYbVo=;
	b=UGSk82aMiCqK7cRo0tJS346nHxQmqv5ZF5/bxRRZC2U7PSF8u9UADOz5w5dsOYlDUYZt
	 zdeOk7tr1s7yRdiQshjP8DIYGOLNakTn4fti12EPzh6N0I1XD88p2f4pwBmgDRhIG/jcg
	 tKioclehC+PKeUFGH+38Rhtv2mY/f6i6Y2Pqn357JQubICmn06j34QpG5qhDJpy6xyheA
	 ZGttLTyS/lKksT3oE0ZN8zq2/aV3unmQWBu86tpM86Xeju0NrvzMU7VkAab6qbTz28bBt
	 Z/nrIKMzCAv4d0eKH8ko4/UjfKJqgWsaa3O7+xiR2l8RQFBK18mteYjmcHb1tTmeEBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=l4F+8khy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6539A606A324
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 03:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6539A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=l4F+8khy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Na1sf9E0aieAObvFx9PIk9R9bWlM1/FWocbXjb67VI361tkwMxLhIyvacFKWNMANh1i+PfJ3HqRHOS+Z0WPvvosjw8qSGIPVYos1/EF9Belcu3LgEmauNuxy6Ee6ntqgTp1jBWDlFESPU6W+0W0sxYNCc/qLjie9H0M49H60QR94CJYkFkps6VFyZGCgDPCQOQYzLN75gz7worDhc8v66TKTSAnEgU5jKK1nVPTLJeUnoPp7sIbGSXQcRW8N67Vg025cm311i+WuAWYV3/TyvTGTzIQe2F0RE7IqYXE/BqHO+fSZAxW8eGUuXIIGz5XVf6FBkJHTeOjjnLUyHjWLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQ7Ae3MY36o0o9qAXtor2dD3d0Ah+wXHX51EIYrYbVo=;
 b=CNFvT0ncTx+nql80gDt6dtIIE7yxmLnGdf/GNq2hn6Qltw4b+eN6BdckFC6HXvRqJE4rl7bd33cXLfC6CFWclG9bciuCqt+Exmlrsn/UlPuhc7jxgr9QhAMNWVpg9dscN40fYYmjCtUZKTRFAcsGQDchP5B3vUdiIS904XGA9pkmVndzy+SQr2eWoQjwgfi/FCfpHIC8GLAXhbOWHIem+a+WOTbN149P55qL7J4YlKx+UqKVJUV6kMqrSOVYHrG4rTvG+GxGbXCjiBQH4DmuYttuHl3PQ+p3u9jC8DHtG2+EQagAT5QCpbfC8FrLuGx6tqY7btRUQZYqFpEPUolgvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ7Ae3MY36o0o9qAXtor2dD3d0Ah+wXHX51EIYrYbVo=;
 b=l4F+8khy/663MPx2G1jIThW456dbbWlabnmDMf/acO0he0DVKws4Q+HPfmRGjxYjqSVTX1ijStNn6+iR/nJHeWwMNvBOk7lxUisDbucHfPxwM9Zd4HkDPakQxX63iWzG4Sn5rx6tao93LXC57vL4H+/5mTI+6XczTlsy2GKyczY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17)
 by DS0PR12MB7608.namprd12.prod.outlook.com (2603:10b6:8:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Tue, 27 Oct
 2026 03:49:30 +0000
Received: from CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2]) by CY5PR12MB6252.namprd12.prod.outlook.com
 ([fe80::ab00:d77:6014:64a2%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 03:49:30 +0000
Message-ID: <cda399f4-80c9-473b-81e8-f03e6268ed33@amd.com>
Date: Tue, 27 Oct 2026 09:18:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] soundwire: amd: fix IRQ thread dropping
 STATUS_0TO7 on simultaneous wake
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>, "N, Poojitha"
 <Poojitha.N@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-13-Vijendar.Mukunda@amd.com>
 <sashiko-outbox-184996@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <sashiko-outbox-184996@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::13) To CY5PR12MB6252.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY5PR12MB6252:EE_|DS0PR12MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: e62053c3-6394-4eac-7820-08df33dd4e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|18002099003|22082099003|261026121527099003|3023799007|11063799006|56012099006|4143699003|261009223027099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	dkbxpVKEyFiBNfbmOG4Pd0/hNa6UOthaf0XEKg/SJDimKMzPLQLB0j+AoQurNxm2pMm+nvBs4OlEp5DSn8PnPo41U9kNri0w8nQq1AgVFCxjefTlaiKoOAuhBOD++gIohixuDMMoL3F033iu5UX2P7KAjLiB/dPTBMVu4AWAoEoCQZuMxMSK4DugbGD3ONmjNwpYnE4VbyxdmqzA1jl6FZQ3sAfvqn4IBbva0o+Jnofl9Hz3OFj20AHNYsFbE5CNhJlqnTuITl9mXbG0tXOsBk9QDwoVIH+87GylQ7rFE+6bXL/cDqlr5WZIe+ut1cpwn7QF98H4lMLIkuSXM2P7q9/DYNtTmwZweVxvsQXZuQV4NF87inRtA9KelwG7VHH69qZQwpIIPQ3XYW3Wp17ls9m22bBCXA6nmpmsNeTXh21IEeT4MRM5kO8nqWLPO1122M8wowuPf5CYO4Lnu5AiluENsLeoT/RG0mraOmZ0qArGcxL+8JHl9iQEBD1os3dt1m+R1ccUsOmvgIAkfZAgYNrP+2S4Hq7qAmF56pQ7xDhHmmVCAyWjTxxX9eI0rGz+oIPnFGrWscLTyi5GPndAhnCG3Ikn6t0uvBsPjU8x4r2w/OiQIUFx3IzXw2maIvKl4R14P8luXqZ/nAaYF1TuTwic/ReFkkYrkh0fGjLqQRI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(261026121527099003)(3023799007)(11063799006)(56012099006)(4143699003)(261009223027099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnc3TWExUWZtWDJadXQxaEFBQnRVczdMR0UraXZOQVdlWWI4dVRiVldqSm9k?=
 =?utf-8?B?cDZBcUU5ODlmbkZCOHFNeGdnVkNoVEdjbGk3QzZGTXBQNHV1dlBybDBVQ1NY?=
 =?utf-8?B?NHhsOEVxNmVYZm1HcXVrWHN2R2FGYVRsTyt6VFNnV0hSMGFnZHMrQmxoQkg0?=
 =?utf-8?B?VzdSWG95UVJaVmE0K2JhcWFNYXU5UzlaQ1NVWi9rTzNybXZzRm52M0c0WGtm?=
 =?utf-8?B?Y0tJU3Q4YVFTOVYzVFFsOUsxRzNCYlpGL1NrSjY2UEZObjB5UWszUnpqTkJr?=
 =?utf-8?B?aGlxZWM1ZmxvVnhtb29vMVE5UlVuUmJrREMwUjhYdkRTU0dIOWNsUWZhNlF4?=
 =?utf-8?B?aGQ4dzRBN0oxTmV3aWpwNGtmVXcrbmF6M0F6Q3V2bHJ2UEgzV0NkRDdkanIx?=
 =?utf-8?B?QlFyZGZPNk8zNjVzKzdvemlSOURIK0N2RWd2WnFWVXl6TzAwNUlKamNpNjVv?=
 =?utf-8?B?M0s4ZER2M1VZd1lNTnB0cDZyRWNXYnk4dGFKOFZBeXpMNlp5RjJlejF6SWU5?=
 =?utf-8?B?Tyt6M3dIOVB0S2VYTmVwNlBHbVo1SGtXRlRzSURrTEZ4am14TmVzTHFybDdr?=
 =?utf-8?B?UXlqbjFXb0ZIV3FwakVwVXI2Sk9FWWt1ZDd4U0lqeUNxT1h5bGQ5b0NRYTQy?=
 =?utf-8?B?VS9PVzNHb3ZPdWJpekhEV0dJb1VHZHBDTlkvakVxZnF1blc5bEtmVmkrL2NV?=
 =?utf-8?B?MkZaUEY4cTVieWhaVUVKdWpOTzJtRnNLSlNoN21Yejd3b2tTam5sTGhDeFpW?=
 =?utf-8?B?TjFJWFdiZ2UxNkxFWGd5d2hoaXN5dng0Sy9ia1BSUXh3VkE1cXAxWlcycW1s?=
 =?utf-8?B?TE1MbkN2aUp4My9jdGpuRFYrQ3RvQXJPZlhtbGEwTS9zcXdhRUFjN1BqbkFO?=
 =?utf-8?B?ZGtDYmtVMDBTS0VCNTVXSCtBNjRRUElGZFNlcGlQUG9VL00vd3ZEM29RY0N2?=
 =?utf-8?B?TXo4TE9NNXNXQ2ZVTEhPYkRCS2FoMHp6cEFLY3hPRjJ3eXFZWWhMazBHbGQ0?=
 =?utf-8?B?L0k5QmtWTlNERWFwa0xQanRwMXpRQ2xHcm5neHVqQ2UwUElqbG44eEFLNHZy?=
 =?utf-8?B?aklpTzYxSVZod0FFOXRZZzN6OWpzNUpzT2o0cXRFQjFKN1owaEFqa1RHNlFN?=
 =?utf-8?B?WHJtT2VoZ2oxaFlLd2l4UlZOb3ZhaHRWU2R1WkhmbkVGVzBSSUtkRExLRDdI?=
 =?utf-8?B?QVNtUnN4TENaYndHUnVQaHlWcHh0bk1EQjVCNkNIcDZMbXZUUTZxWVlMaVpa?=
 =?utf-8?B?ZGxYMzBVR3JndXdCVkRMeDJydGVDTVAvektvRDV1dmJVYU5YRWoyUGgrL2pj?=
 =?utf-8?B?Y3NjY2RmeUVGck9FbTAyRXNXQ3RiSElHZThySmg3VHYyUFRjWitBMnZ4QTM3?=
 =?utf-8?B?WXZITXZrd25Sdk1YSk9xL01WdzgyMlFlQU0rZ0Exc2o4VEpUVHlXRjJVMzA1?=
 =?utf-8?B?cjNiandXR2RFcE5xNHBPUzF1OHdKWmh6aVo1RFU4K0hDQlBydzR4Sy9odVhk?=
 =?utf-8?B?NWxKMTJlUXFxaFpMSHAvRXVNVGtEZXNVZ25JcEJKV1JBU1EwYkcwblRzM2hs?=
 =?utf-8?B?eER1MloyUnI1OXVidkt3VXJOQ1AyNmhiVTErR3o5OXZJb1hOcWlISm51MXpt?=
 =?utf-8?B?anl3R1ZqaU1yaHM5cUFBbStxYWI0eTZYaWw3V0ZmWnBXT0dES29MdVIxQmRH?=
 =?utf-8?B?ZnZYSSsrV1BScWIrMnlWUjRkTllhOVRPeHFBM0RrZk9ud0haWFIvTVQxeCtW?=
 =?utf-8?B?VlJBL284dWN0ZFVQcTFVeVVCZHdMSlRsTFVGMFVnbTI5MEpJZU1RUnIwMy9P?=
 =?utf-8?B?RE1ud25DOThWYkRPZkR1bHV0TnlxeW1kSlllTTBUL0RrU2xOQURTQVBMVWZa?=
 =?utf-8?B?THdMbU93SHlMRXRyYUpKZ2RVOGJWOVQrcDlWUTlUUTRBNzRjL082UlF6ZDNV?=
 =?utf-8?B?YkxNQnQ2aGZRdENSZk9HZXI4UzNHWGR2WGNiUGlFV2trT1VRTkpadk44K3dR?=
 =?utf-8?B?Y0taK3p6Vlp1c1RlMHYxK0VvaFUyWWxTQmVaTWlKUnFHR1dzbHlsa2dzYndR?=
 =?utf-8?B?SU4ybDZEQ1lxd0o2TC83ck5peFlIZlJvNGt0N0RtZzFPbUlaSjEyOXJiUWJD?=
 =?utf-8?B?aEFuQ3ZIQTlablA1bXduVTBKVkJZQ3ljZDhwcGU3VXpaRERBTnhHNW1TQzM0?=
 =?utf-8?B?MXN3OTROUE13K3NENWMzL0kvQjQ1QUpabTJyck1qa0c2RXFJbGtiRllpSnYz?=
 =?utf-8?B?dTBLdG1QZnE0bS8wTjlCVHE1c3FGTE91WmEva0M2TE9IY1REVnhQR1Vtam9v?=
 =?utf-8?B?c0dXME5vclBpMDd5V2VmNWZLSmcwdGcrVEFsYVdteW96UmlRQjQwUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62053c3-6394-4eac-7820-08df33dd4e17
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 03:49:30.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4k1A/ilyXGjefVCKzhyKTB+rTOY5NZ+QP8QxzeIP5m6zFFQkaDcBIbW02vesn65NQyyBU6UmmzmHheUdviCiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7608



On 10/26/26 16:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] soundwire: amd: race with runtime resume in amd_sdw_irq_thread() on wake
> --
>
> commit 926ef4f8a65a29a6e1b8f7dfc94a0c8f49817776
> Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> soundwire: amd: fix IRQ thread dropping STATUS_0TO7 on simultaneous wake
>
> This commit removes the early return in amd_sdw_irq_thread() when
> handling a SoundWire wake interrupt and masks AMD_SDW_WAKE_STAT_MASK out
> of status_change_8to11 so that simultaneous peripheral status changes are
> processed instead of dropped.
>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index d7289b840513b..16dd17f7a343a 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1019,8 +1019,11 @@ static void amd_sdw_irq_thread(struct work_struct *work)
>>   
>>   	dev_dbg(amd_manager->dev, "[SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
>>   		amd_manager->instance, status_change_0to7, status_change_8to11);
>> -	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
>> -		return amd_sdw_process_wake_event(amd_manager);
>> +
>> +	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
>> +		amd_sdw_process_wake_event(amd_manager);
>> +		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
>> +	}
>>   
>>   	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
>>   		amd_sdw_read_and_process_ping_status(amd_manager);
> [Severity: High]
> Can removing the early return here cause peripheral status processing to
> race with runtime resume or execute while the bus clock is still stopped
> when waking from runtime suspend?
++

The fall-through is intentional and safe. This fix handles the case
where a peripheral signals a status change while the bus is already
active — wake and status bits can arrive in the same interrupt cycle,
and the old early return silently dropped status_change_0to7.

In AMD_SDW_CLK_STOP_MODE and AMD_SDW_POWER_OFF_MODE,
amd_suspend_runtime() calls cancel_work_sync() on both
amd_sdw_irq_thread and amd_sdw_work before amd_sdw_clock_stop()
runs, so the irq_thread cannot be in flight while the clock is
stopped. After clock stop, only the wake interrupt is re-enabled.
ACP_SW_STATE_CHANGE_STATUS_0TO7 and AMD_SDW_PREQ_INTR_STAT are
set only by SoundWire bus transactions, which require the bus clock.
So when the wake interrupt fires from suspend, those bits are zero
and the fall-through path to status processing is not taken.
> In drivers/soundwire/amd_manager.c, amd_sdw_process_wake_event() only
> queues an asynchronous resume via pm_request_resume():
>
> static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
> {
> 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
> 	pm_request_resume(amd_manager->dev);
> 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
> 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> }
>
> When amd_sdw_irq_thread() runs with AMD_SDW_WAKE_STAT_MASK and peripheral
> status bits set in status_change_0to7 or status_change_8to11 while
> amd_manager->dev is runtime suspended or resuming, pm_request_resume()
> returns immediately without waiting for amd_resume_runtime() to finish on
> pm_wq.
pm_request_resume() returning immediately is not a problem here.
The irq_thread cannot re-enter until the next interrupt, and the
next SoundWire interrupt only fires after amd_resume_runtime()
re-enables interrupts and brings the bus back up. There is no
window where status processing runs concurrently with an in-progress
resume.
> Execution then falls through in amd_sdw_irq_thread() to either call
> amd_sdw_read_and_process_ping_status() or call
> amd_sdw_update_slave_status() and schedule amd_manager->amd_sdw_work
> (amd_sdw_update_slave_status_work()), and then clears
> ACP_SW_STATE_CHANGE_STATUS_8TO11 and ACP_SW_STATE_CHANGE_STATUS_0TO7:
>
> 	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
> 		amd_sdw_read_and_process_ping_status(amd_manager);
> 	} else {
> 		/* Check for the updated status on peripheral device */
> 		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_manager);
> 	}
> 	if (status_change_8to11 || status_change_0to7)
> 		schedule_work(&amd_manager->amd_sdw_work);
> 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
The fall-through is only reachable when the bus is active. In
AMD_SDW_CLK_STOP_MODE, ACP_SW_STATE_CHANGE_STATUS_0TO7 and
AMD_SDW_PREQ_INTR_STAT are only set by SoundWire bus transactions,
which require the bus clock to be running. When the wake interrupt
fires from clock-stop suspend those bits are zero, so neither
amd_sdw_read_and_process_ping_status() nor amd_sdw_update_slave_
status() is reached.
> Neither amd_sdw_read_and_process_ping_status() nor
> amd_sdw_update_slave_status_work() synchronizes with runtime PM on
> amd_manager->dev before accessing the bus or interrupt masks:
>
> static void amd_sdw_update_slave_status_work(struct work_struct *work)
> {
> 	...
> 	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
> 		writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
> 		writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
> 	}
>
> update_status:
> 	sdw_handle_slave_status(&amd_manager->bus, amd_manager->status);
Explicit runtime PM synchronization is not needed in these functions
because the suspend path in amd_suspend_runtime() calls
cancel_work_sync() on both amd_sdw_irq_thread and amd_sdw_work
before amd_sdw_clock_stop() runs:

     amd_disable_sdw_interrupts(amd_manager);
     cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
     cancel_work_sync(&amd_manager->amd_sdw_work);
     ...
     amd_sdw_clock_stop(amd_manager);

This guarantees neither work item is in flight when the clock stops.
The bus is therefore always running when these functions execute.
>
> In AMD_SDW_CLK_STOP_MODE, amd_suspend_runtime() stops the clock and keeps
> interrupts enabled while clk_stopped is true, and amd_resume_runtime()
> restarts the clock in amd_sdw_clock_stop_exit() before completing
> sdw_bus_exit_clk_stop() and the D0 transition. In AMD_SDW_POWER_OFF_MODE,
> amd_resume_runtime() resets slave status and reinitializes the manager
> and interrupt masks.
In AMD_SDW_CLK_STOP_MODE, after the clock is stopped only the wake
interrupt is re-enabled via amd_sdw_wake_enable(). The
AMD_SDW_WAKE_STAT_MASK bit is set by the hardware wake-detection
circuit, independently of bus clock activity. Peripheral status bits
in ACP_SW_STATE_CHANGE_STATUS_0TO7 and AMD_SDW_PREQ_INTR_STAT
require the bus clock, so they will be zero when the wake fires.
After AMD_SDW_WAKE_STAT_MASK is cleared by amd_sdw_process_wake_
event(), status_change_8to11 becomes zero and amd_sdw_irq_thread()
returns without touching the bus.

In AMD_SDW_POWER_OFF_MODE, amd_resume_runtime() fully reinitializes
the manager — restoring the clock, calling amd_init_sdw_manager(),
and re-enabling interrupts — before returning. The irq_thread and
amd_sdw_work are cancelled in amd_suspend_runtime() before power-
off, so neither can run during resume. The next irq_thread execution
can only be scheduled by a new interrupt, which requires the bus to
be fully up — guaranteed by the time amd_resume_runtime() returns.

>
> Could amd_sdw_read_and_process_ping_status() or
> amd_sdw_update_slave_status_work() issue immediate commands via
> amd_sdw_send_cmd_get_resp() while the clock is still stopped (timing out
> after the status registers have already been cleared) or race
> concurrently with amd_resume_runtime()?
No. As explained above, amd_suspend_runtime() drains both work items
via cancel_work_sync() before stopping the clock, so
amd_sdw_read_and_process_ping_status() and
amd_sdw_update_slave_status_work() cannot execute while
clk_stopped == true.

Likewise, there is no concurrent race with amd_resume_runtime()
because the next interrupt (which would schedule the irq_thread)
only fires after amd_resume_runtime() has re-enabled interrupts and
restored the bus. The runtime PM framework serializes this: the
device must be fully resumed before new interrupts are delivered.

