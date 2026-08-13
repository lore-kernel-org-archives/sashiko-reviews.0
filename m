Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6248CD46;
	Thu, 13 Aug 2026 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637114; cv=fail; b=IbU+s7onsEMAxCmvaba2IfYWriBrakbODSiqd0uI4zHX7BlN7eDPcSGShMR2/6R+CYjrhIoA9Ts3tJDUTcmyaXox3x+f/deIInJhmLT0LIl/GF7yntC0hyMPWj2ndjJEqKealSGMn9sA2N2S1pr+/gkB2BBlTHcMP10URu9gqu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637114; c=relaxed/simple;
	bh=J10CZaHyuCArUG5XVXYQnwm9sUlsXkyIdMGDPcM6nro=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=QjTBdkFFV39VSKoXwgTbCZrEY71GjHAgwce894gLWobeZyothlG7f71IIQZz4/AIeTUOK6dPgIs21/GHbVtEDziPRzLiN1UfSLJxTKSTkIYEVB9lFkI5m2jMj734NrjbmYOhbzmn2+W6ZpOs6bNrQJ66bA33MTktlTSpCf9trNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IUWYsBOL; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CmS2KO85; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IUWYsBOL";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CmS2KO85"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFV6sV3455089;
	Thu, 13 Aug 2026 11:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=fSD3E25cEFNfrSNZBZ2fwSgJ6S8jJoQpbCKlaoNoN
	yA=; b=IUWYsBOLqHWIXC9DD0aHoRLjoMcO46A/9D34FTpXy6ACVLn1QB+8EwSDr
	jo/SsbIYdvvEiHm+UD4h+o/fZVSx8iLwp4u8BuLcUceRFkIufvZ4MQyKcbYBG0ak
	rj+6oT2xKnJAxRCmKi/wOaVEVRer0wCXgthOnZxERNGQgnwCVucABBR8oNbxtbm1
	8HJv2pKso/HMJYDBjqHSpTZdNofRicpybU/o5UDQB74O+u5h8DI76mRSanZXRBez
	ZTGAk1gaMNvm+NpGhIy7s+q9TSF0GKAVvbNS8/RnedoZBMgcXH9V+A+wHFnMvlsX
	DcmKeQpxdTMa0gSGBBFkVSG+MUQkg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g1bb4abdv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 11:05:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBgi7DLFzz3cRMka4O8CFcdlE1l1gqserO8KYWGJbl7Ixn1bqIOy4C1SjfcuKFHFrNHT/twijqZRtMpXaXVzowUEPsFYPfUEr5fo5d7Pi+R6Sz4Fksa7QP+BJRovSOXtoWZhMTGLTFFvJ/1yyA3nIgyqBS2gZSlNGt6bxolTqOCIBGTH0Oeu5Ub3HES+87xbY46VCIi1ZTzEjsF3nOlj2x1B5puja6F43YVF66TKhCi5hIKRMwfOFngXqml0GilNaWGg2fYYWjqdO3OTy3E6GH4j9FYD0CEK54yE9srt5zC8rXriVH9qA13P0RAk9Zy0PzEKmnSQXX8/5qoBuf3E9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSD3E25cEFNfrSNZBZ2fwSgJ6S8jJoQpbCKlaoNoNyA=;
 b=AIFSmhd2j7f4g8w+MZqOBSvtx2LKD19/i1UQQwsk4MBp7NOdYNYqm41AGi/ZU3huD82zVMr3E1OKP8uqLl/gJmFbwRhn363sTc+iZMrKccY62DQuI6eesoQ23cetLruCD1UjO8WLnXkoIxZ34fRcS9WG7H3NN6AB8TKWahl3pZSfEcseIcwqRPwFQrc1ke9fxKT3XhxClqKfdkqsSWYSRGbNQRTCgUBLecz6I7Od8uvDdZEk7LK/jp+mgllF3rftx5eNAh//qMKebNpQBDjfmx/h+UGFHai4ALn81SkJKUF2EThEOlTVltrHZTYundIGCLmxatmjNgndzlO2jxZUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSD3E25cEFNfrSNZBZ2fwSgJ6S8jJoQpbCKlaoNoNyA=;
 b=CmS2KO85E/OCQ584XzwVQOh5oXvq/HjUguuz5hFJkUfkMviZ180Io3Lelia/DSUq+VmJEfvvW7J8LyhBhkoJbR4t0Qbc/vLIK8yPyg/hdlzNGe5HsBmKlf3i7STZzHoOkJgWjt7PtWXDQX1X50nGL07gAib1P7smMRbeaZduVDA=
Received: from MN2PR01CA0048.prod.exchangelabs.com (2603:10b6:208:23f::17) by
 PH7PR10MB6283.namprd10.prod.outlook.com (2603:10b6:510:1a9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.11; Thu, 13 Aug 2026 16:04:59 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:23f:cafe::23) by MN2PR01CA0048.outlook.office365.com
 (2603:10b6:208:23f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Thu,
 13 Aug 2026 16:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 16:04:58 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 11:04:23 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 11:04:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 11:04:23 -0500
Received: from [10.249.33.100] ([10.249.33.100])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67DG4NRj1130695;
	Thu, 13 Aug 2026 11:04:23 -0500
Message-ID: <fb3ddaf9-3fcc-41b5-ae43-2031527be647@ti.com>
Date: Thu, 13 Aug 2026 11:04:22 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as
 OUTPUT
From: "Mendez, Judith" <jm@ti.com>
To: Francesco Dolcini <francesco@dolcini.it>
CC: <sashiko-reviews@lists.linux.dev>, <devicetree@vger.kernel.org>,
        <robh@kernel.org>, <conor+dt@kernel.org>
References: <20260813111238.56892-1-francesco@dolcini.it>
 <20260813112458.BA9481F000E9@smtp.kernel.org>
 <20260813132230.GA63265@francesco-nb>
 <278014b0-cc23-407b-ad13-6e6860d8564e@ti.com>
 <20260813154714.GA89702@francesco-nb>
 <d73d0235-857b-4191-9f52-854dcb9e152b@ti.com>
Content-Language: en-US
In-Reply-To: <d73d0235-857b-4191-9f52-854dcb9e152b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|PH7PR10MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cf5871-d32d-4f84-59fd-08def9549f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|18002099003|22082099003|4143699003|56012099006|3023799007|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	JGLfx/nneenpSu5V4zAEDg2KNxWITEPAahZaVTGczxXfULDJU3LOcbAWhS7OwDVJTT7ZJpy4Mthm23yCz9+ias7tVXufj50DBzd690gVQG5Rl6u1G9ugnrJrdwA/D0YRPYDIYLNyT2gs388W/MqFRsfEKJBlCZvdWY3x/KhcFMpBmk5ychT+DTHrydysdDGO2qnRt3+rxQDXz1fN68Zkh46+ljQpWj8IoK91ODb9DRGGo3hIyhXC4mdoNhfwJN6ZpBN6cKcXdUqW2Ztl3/wpM+xn9nAe/8zkMP/1BGiTnmM6t1wvrwFbnt8uZ96KzsLEBTP3Mb0bpIZDCGTICv6IUNzgDNDdrQMO7F5ogXz0VJJiIaOBOwCwFDkWOVFNJLMN1UqteWnYN1WDYPfAcQnuweyPKevpTeLdauYI005GT9330/0Kg4l1FO6Z0RFwCHmqDJn2De542tXrs4WpFD9L3tG4DC0i3O1XaBn2HqheLYtjMoeonLE/Qbb9HJ8mV0I9imTsh4Z8HTLvrZ7fFUXUOJ8lbOJOweMHVL6FJhMoNrvdlJ8R+FohWGBLmYQMwXZDIL2vwqGCy5VWo/Gk83YR4mW8sZixSkgojQwd4g2cySxfdiE19INIbQvapPsRno1CjFEp7uoh8B8QlxlbQV5vZm0sNgK8jml271nKyIhrmvhdwIeTbGiSN2O5Fmth7kSOJyjnQpoTDjPR1j+XKCdvSQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(4143699003)(56012099006)(3023799007)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9QC7SGMW4oLcQxcU8BaDNlgFeBztRzwpffSep/eOD/5z6Hrnl0TcpRZGwasGUjQMISoDtAaOdWsozC3Rp8okNwyYQNV4o9FJVs6L8cxpLPCeDY0vzGn5f0YkPG5oxICYIg5LAR+4UcADXTO+ns+/Yy2Mshxda+LUHXN3YsOINXL/4gMN0RpVhpRQUFUlX2hTD2pRCEGlBeADNhxKf+dOgcIDl7DfVN05IYDqDqZYFniyMYNYN0Bd3NJfMNInrJBRIDOcQw3ohPj2B9LdYVaPSzf8qiyFK0PAz3NTqaJA68mz4Dy/QtsaurARR1+yOeteuTO1NFMEtsk3rDV2Vyp7kEKSdl9ZtE7V7Fs80p9yfI4pvUACeIn7HntfzKEM0HSH0B4V5307PYJPdtjJ5Bks6sgCIfs2rPoVCs4vW2e9B4cfhVxfzKL4PWy1SgtX1gYv
X-Exchange-RoutingPolicyChecked:
	AxYxO6sBZHMk8Li433fnOXExuyRGJeMWpJPhtnNnjRyCc+8cr/St9whJKPUqdS5e4HRsVzkNvQUGaT/KQVL4LTe1jp76f/YfjOBh/LTJW5eyy8BbR67b0NWkK0PLvTTWPPQ9+zzgyggsx+CLWfriHNfsbWXp0SFcjS9YN/reIGuyIZPnJzswdC5NU13M2IJAUnK+DFQhkMZhGRGX9ZYDq/dYk11+++dNGbpubXMeHmXU0/tzoiqqW7CUidhKDcWzzLX4dannpE1zHNqpXzxWjLQjSwLdC9T9YAZEgDSxOSOxYJHnlIqAKbDABcNC+LfyAI1SiJPTZ8Ce97kTdvWp2g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:04:58.0523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cf5871-d32d-4f84-59fd-08def9549f80
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6283
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfX0kxS9xEPJrhT
 3YYUs2Cr/2RZyMMVsj6YeIhOMPl+mXTdGazDQMAVjC/FGCigqhCIlB6yargGrYaVGFYMPd0wcYo
 4+x4r0bxovi/helll1/rjxkMr0c7VBY=
X-Authority-Analysis: v=2.4 cv=W5sIkxWk c=1 sm=1 tr=0 ts=6a7deb33 cx=c_pps
 a=GsI8iPYaTsLAaW3Q0Q+aKg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=m8ToADvmAAAA:8
 a=9ttOd53iGlYzypd_zzwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNiBTYWx0ZWRfXzj8ujGDuUvz5
 mUGZ4UussUZTUkAWPx4aWepxOxVs4SDOf/F86IeBoREPYzTS+wfH76vq+CCMqzgTGsthpqrBx5v
 YNyTN25JIPMY9aScqoK3sXD6vqPnACEYwnNjh1dVbD0j/2P7ZCNbaGL0pcMHFYAhfMmWqvPlqUS
 eenB8T8cJ+FgNso6nwb7ds5NchWgpbrx8Kb+VCxpiN+ZRBQmBB4jJqpKp+YH5t+SQZl6poPIq1E
 l3KUSJbsH7GlwO8cYYsJj1eNRnpLpJ+JCKUAuE3wCeXbqJyR2VKDzGAT4fUeN27iiR3oZLG05Ik
 xIRtNSyZlTtn49zUW/cV+dy6/YpGFWuUjjUoShnRoAgI9Sxj0s4LCrdV4c6mjHTAsy5pAzWQE2f
 iyDdl329ulu0X5vIvijnGstTylpZ/kffMTGZcbgiUOEufze8OgprqmY/jLdDP5urhbZ3ZyHWox+
 eGEwIdgEw23ZUW2V8WQ==
X-Proofpoint-GUID: 2_WL948rgzhLlWybDvO-AgG9xaGkHP-v
X-Proofpoint-ORIG-GUID: 2_WL948rgzhLlWybDvO-AgG9xaGkHP-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130116

Francesco,

On 8/13/2026 10:58 AM, Mendez, Judith wrote:
> 
> 
> On 8/13/2026 10:47 AM, Francesco Dolcini wrote:
>> On Thu, Aug 13, 2026 at 10:45:35AM -0500, Mendez, Judith wrote:
>>> Hi Francesco,
>>>
>>> On 8/13/2026 8:22 AM, Francesco Dolcini wrote:
>>>> +Judith
>>>>
>>>> On Thu, Aug 13, 2026 at 11:24:58AM +0000, sashiko-bot@kernel.org wrote:
>>>>> Thank you for your contribution! Sashiko AI review found 1 
>>>>> potential issue(s) to consider:
>>>>> - [High] Setting MMC clock pins to PIN_OUTPUT disables the receiver 
>>>>> (RXACTIVE=0), which breaks the internal clock loopback required by 
>>>>> the MMC controller for read operations.
>>>>> -- 
>>>>>
>>>>> --- Patch [1]: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC 
>>>>> clock pins as OUTPUT ---
>>>>> commit b7e315f9edd8f485234748a2f8e267539b5b0f30
>>>>> Author: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>>>
>>>>> arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
>>>>>
>>>>> This commit changes the MMC clock pins for the K3 AM62x Verdin module
>>>>> from PIN_INPUT to PIN_OUTPUT to match the TRM documentation, 
>>>>> effectively
>>>>> disabling the receiver (RXACTIVE = 0).
>>>>>
>>>>> Link: https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. 
>>>>> MMCSDi I/O Signals [0]
>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/ 
>>>>>> arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>>>>> index e97b2b047d104..895b1b7dcac71 100644
>>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>>>>> @@ -573,7 +573,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0)  /* (AB22) 
>>>>>> MDIO0_MDIO */ /* ETH_1_MDIO, SODIMM
>>>>>>        pinctrl_sdhci0: main-mmc0-default-pins {
>>>>>>            pinctrl-single,pins = <
>>>>>>                AM62X_IOPAD(0x220, PIN_INPUT,        0) /*  (Y3) 
>>>>>> MMC0_CMD  */
>>>>>> -            AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) 
>>>>>> MMC0_CLK  */
>>>>>> +            AM62X_IOPAD(0x218, PIN_OUTPUT,       0) /* (AB1) 
>>>>>> MMC0_CLK  */
>>>>>
>>>>> [Severity: High]
>>>>> Does configuring this pin as PIN_OUTPUT disable the receiver 
>>>>> (RXACTIVE=0) and
>>>>> break the internal clock loopback?
>>>>>
>>>>> TI MMC controllers generally rely on this internal clock loopback 
>>>>> path to
>>>>> synchronize incoming data for read operations. While the TRM 
>>>>> documents the
>>>>> logical direction of the signal to the external card, disabling the 
>>>>> input
>>>>> receiver might lead to eMMC read failures and timeouts.
>>>>
>>>> Judith: is sashiko right on this?
>>> Changing to PIN_OUTPUT should not break anything for you on AM62x based
>>> board. By default the input buffer for CLK pin is not used, CLKLB input
>>> buffer is used instead. CLKLB input is already configured for you by
>>> default, you should not be modifying CLKLB for MMC0 nor MMC1.
>>>
>>> This logic does not apply for MMC2.
>>
>> What do you mean? that MMC2_CLK should stay as input?
> 
> Well, there is a reason MMC2 CLKLB pin is defined in pinmux nodes on TI
> boards (: By default, MMC2 CLKLB is disabled after reset unlike MMC0 and

Meant to say MMC2 CLKLB input buffer is disabled after reset by default,
as in, RX_ACTIVE=0.

> MMC1. If we do not enable it in software -> PIN_INPUT, then the MMCSD 
> loopback clock input would not work and your MMC2 would not work.
> 
> ~ Judith
> 

