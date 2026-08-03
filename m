Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F86F346E74;
	Mon,  3 Aug 2026 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795989; cv=fail; b=LKovzB+xRNxYRlIezyypzg/zebe/V7EIw3ExTq1D970uAmXeSh22NVUGm3FYBlDx2bOXlrY9109P2oFyphaVTUXPstXOVNHIbuEBhFjJJZ0jRr5503kgdArxLlbbrbGrDuJ1T8jTx9n61qkGflaO5+v3KDXXyeudPQXHqMBSRMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795989; c=relaxed/simple;
	bh=JGHPhyIgDIcXbqu5EYyc9b0HG5XTgR6+2VPWnMmpedg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KMJfcsRSJ7vq1meuylMymkqVumPkSYk9FbLsTejNtYbfwT1cPOmR0ErRVPVo1n68yFcZ0nrMT487TCfU+W0cLcNKjOT/WaaWI9C4Jci7csJ/cgH+JCo/4+qssFe4ODH35PR2RPyqRIRODQywhcbSevaSC8hhmWyEP6O5nKdJH5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=j38uZCl5; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iJnBIQxg; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="j38uZCl5";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iJnBIQxg"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673JjGKX779495;
	Mon, 3 Aug 2026 17:26:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=BBsqva8dLMWFhGuwdVJ0GySFcAGyaST5WcvEHrAcr
	iI=; b=j38uZCl5kSnfgX4w0eNxJjKvkCYk22ou3ADY4LmUIqz9E4hkx7QkfTxHg
	KYu1aXwwm8TnLE2JmPVv/YgfHyX8zeov26f2CXkKaXghIEcmeVSr8REVjvaesmfY
	y0KdGG566cJuk2Qg5Z/uNjO0h4iqoui2HrQ8edWTJnmoiIKaVzND4xYZK4XjAc5O
	LkBq1kB565goMxvA0iyJqS6qVv2OdYXuGHotAghllh8ESkdJF4OS+XSgRofXbm9p
	3b2Lw81PmrTs8DbUmbLWmmEAJc/2iWd1tfr5oHqpp+2v7XDJNTjZpDfOmEOs+5M+
	1xLYItkfLIpUxTry5awuUzsHdgqIA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ftt0amsg6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 17:26:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idDcFP6aocHEMnU2ZGAwlIZxWqBKEDGCDfryhvwBCYgFTvXKkjPqGDQqhclLZGv2HXisvl57K/VuwXD4Yg6KVWz0oFxElugXUrsppCYHrY0//qWmkI0jjy2WJXx58LeE3ivTgqsshsv6hEwfBO1PMDUM4+ZdiPJ/wu81qvk4UmxRNEgSXv2WXiG7T07sqIeOnvDx92lVezqWMRDbBWJn8hFH+yIs8JmMoceLiAU2t6aSTOXyFMqL+OnfiCIR+IxA+0DssWjvop+avy5E5WvC+c+ZYxfRJIStSTM/l/nbdcdM2AYjDnn4FBJEzMPD0oUWx6+/CbpjpKO96U1xQARi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBsqva8dLMWFhGuwdVJ0GySFcAGyaST5WcvEHrAcriI=;
 b=XmP39tKBN4mse9TFxoYepAZ4V6sBuEovIuhaIrukzO8HJMRe7/gZm84rOFDMfKVsd13YQctBJPlG7VyQW4Py3QZKP84rBiQ8gElNDABW2H0AEBc6GODmDJaCnqBJdbiTt6K5fXnKLBXKb4N2sFrHc68SD50+Fs9+16XYvaFrc6CQu6xxg4Z4miS4U3zcUGgFDwzbfri0RkFvj5P+AcFqVuRpT6WF7PlAUmo9VTdukiscIzEqQ1wpw14CgLoJrVaooSqP4sMTXNBfAijiK2aRIY14+2f//rGHtlbmt0cSJiqcsaDb8IWtPSfR+xp0NCFFlKLS59DIrcQGVArfyTvxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBsqva8dLMWFhGuwdVJ0GySFcAGyaST5WcvEHrAcriI=;
 b=iJnBIQxgP2zmCQjZWBjCllm+GRD2Kk6Tq4do3jFCk1pFOvHOjNMQ/Wup+y36eW7msUIH3GVFW0ZkP5kR8XfjT4tjId+lA2MSXDZop1n9293RfU5LmL5VQ6e03+cqHaLBic7M/kKvamR/fgrEWs5Ho0LkfWNPd4vFfgSd2YYNdU8=
Received: from BN9PR03CA0598.namprd03.prod.outlook.com (2603:10b6:408:10d::33)
 by PH0PR10MB5872.namprd10.prod.outlook.com (2603:10b6:510:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 22:26:19 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::27) by BN9PR03CA0598.outlook.office365.com
 (2603:10b6:408:10d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 22:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 22:26:17 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 17:26:12 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 3 Aug
 2026 17:26:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 3 Aug 2026 17:26:12 -0500
Received: from [10.249.34.24] ([10.249.34.24])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 673MQBjt3263138;
	Mon, 3 Aug 2026 17:26:11 -0500
Message-ID: <9bd53787-0d73-4367-9453-b2ae8eeb3ee0@ti.com>
Date: Mon, 3 Aug 2026 17:26:11 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: ti: k3-am64-sk: Disable MMC1 internal
 pulls
To: <sashiko-reviews@lists.linux.dev>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20260729195958.671147-1-jm@ti.com>
 <20260729195958.671147-8-jm@ti.com>
 <20260729201317.3208B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20260729201317.3208B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|PH0PR10MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: dd693370-877c-40cd-94f7-08def1ae3c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|3023799007|10067099003|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0CdNLnimrzm9lonD4s5X9os/LWu2+ME/FJaSn9fiJVWo0LC+cWrGHcN6oC3erTByzNiZlyhy8yc4EM3LDYiP7K2gkzyY20IKgsjMXDUDMl/+dyxWzpUt4KKbOWXLssKrUF4wmDhW3Kf+YZwNdoxJxBsWkAjnvmsm14DYf5I+JAZ2Y2DnHKBhu1LwelKyTMLt68aBbih3Qy6WgzgU3sCAuOK24ZskpJNNQiHwO1/qzcqho526VaV4kvFd4MclZS7hVqRT6AHShWElli9WbK/QErkMfLwbDEZFXrH+4aYi8I2AW6gs8eYMgpZpzOabiAGlA/mk0TYJW5dVUTcEniurTYX2SBCNBdj1O7SgDQB+AHx61MZiRc8P0dMM5278taMXeGQosC2XBevt5OB8Ct3IWLUDcIH8MQ0EfuFP7+QNczuS9XIgV/LofQsdISHWj+iFYVrdlCVH4jiq6CTzMsvTeKDXRNipc9N0aRHeyDEz/kIe7f3Hu/FQiD9aahZ0XyhKdeQMAhvPi0RZH1E1xSpn2IY+KLCkFgRLMqJupSRp/qV3HrQvf/THlLA6Pwa7B/ONxwHuSRbdHiJ37GEsl+QeEWnnBxbnYMpmjczx/nhEzjy1OCrYTfmQbgoJ+V8w+yF1TYgvzZZllaaRzRGVvqBJWLZr+4p6kvIgU+DK2SQ47kQYHxJ9qVdqExwQibeONP1gn4gp6KWSbLv5dIG3iHZ+Rw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(3023799007)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PqZ+EtIvyfUeOEtVJDKnZfDrABJg7VSyT9ijePvtvgGYLAT6MWoN3BUiFo/TpiZbLhZWwwjkFlqN3onpAQNOx7JNoAV7c7K3ZOlZ+tL9f8mUYfv+znSwlusOjkv0JNU9gepmugFx272Lq69ryPjUO/g46LhoQLs1Yc6VL1SmIGNHZI+x/aRNJSkhjQYTkRh+9biu12BfJ0j978hRwIoWc4zI364OraC4AE/P+dEFUir0Mwklw4Q8PUMslFYRSJthXMphnTHEI+MAXfcHRWrEt9Dnkmf3omcNHfqnKxnzuRMuUGlrDVKG6BTp19J5QRIeMElmdfmNlT2KcqgBXlDADWnsVUo98koG9cllWdefdsNtB/P9Gr2mIjK/imdpPEUuVo9In1W/iVIizuPwnXEqHpJlprSYWk6t4Urxd1M/rjq3CvGtJ+YSwOm/fw0VxYQg
X-Exchange-RoutingPolicyChecked:
	E9YA/7GaqIDcX8v8TeIp0N99/5yqkl/W7UklUbY4gx3KuV+HgIQp5RYpEGhNMGExbtno5aD3prTA987qaZHjBDIYXEgZg7b73KknGF5VK13/DiunCeFvAxaCQjsniAvTAUAXa9SUJDQDF1KilnSvNTM3TZlZFQ3SbbQFHIjmeuyk9qn4Gg/L3tf0mBR/19oABkt+M45fUwvsB/j+Sfr+9bfBSuqFlmZHUgEdvZhvcDw2Pqx6xv1zTVnF7fUWROaQWgYsJYk7j4M1Jrg0iU+5QyxBlwRtUnMhzVIkyggkklrGDOI87nmhk/KAubf0HFC4SmsSswMV9RiBEWq7XD4gdg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:26:17.2604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd693370-877c-40cd-94f7-08def1ae3c6f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5872
X-Proofpoint-GUID: 1CNJpeWryyiJp8qfqXCZuA1OJxeV_DCe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE5NiBTYWx0ZWRfX4d3OcDisiO0Q
 +AXWx1nJtzR2j83ITbNHCARMaZqGVzQF5PxAS8iFUYcocaBYTIklEXuORFSjsmldG7vmqhIzDMH
 SS43VXxBIaYT2dQLoHCcEj63/24VFDk=
X-Authority-Analysis: v=2.4 cv=EpniaycA c=1 sm=1 tr=0 ts=6a711590 cx=c_pps
 a=8M1/PN84ODQM9BgHet7h7w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=bwUDZIPJcFxS_mExbQ0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 1CNJpeWryyiJp8qfqXCZuA1OJxeV_DCe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE5NiBTYWx0ZWRfX7HpfekZ7Btyb
 4945HN02CUbAKhHNaQT0vXkFlgLDtFgIXz/8W7K8nt+57xG3JEOHs0NCGGHdcKwZvxWYbqC8g/8
 sMrAX9Hu9osyqJipF+EFbLHw9C9h+pwq2tkMzrscb/AiMRFZawt1nc6jMrgY2oc1ZWlNNwaXQNb
 wnlUuiAV3hRtPTRXxnFx2H4goKv2TUTt71TuIWB7DYE4AWAbJYUsku4956PRZoKOdBlltdxj+if
 JJXtH1YnAnTE7Rj020xRBH9orqrwiTm7nVe21pr0J9RQ1IDVQlzkMCXZHRl2ievU50J1wC84feu
 aUmVK28hK0jt27FtbByUzT+2XmEX/d0LZycW4tY9DZj52NC5/xaK2Hb3+GTcIccMevqbiwiJ9Zk
 Luuqj7HlUgo3SRkwTu88o93k3xKVJf8EjlE9BZZyUSj7IzNLXVVqKFXXbUcepeKHcb8QgbS+nLv
 uKRIjJ3b0yVD5W0HjKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030196

Hi all,

Addressing Sashiko review.

On 7/29/2026 3:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unintended removal of pulldown and incorrect receiver state for `MMC1_CLK`.
> --
> 
> --- Patch [7]: [PATCH 7/8] arm64: dts: ti: k3-am64-sk: Disable MMC1 internal pulls ---
> commit 3a83d1bd44a1ef684b5bd29a93a2127e82509201
> Author: Judith Mendez <jm@ti.com>
> 
> arm64: dts: ti: k3-am64-sk: Disable MMC1 internal pulls
> 
> This commit drops internal pullups on MMC data and CMD pins to prevent violating
> minimum pull resistance specifications, as external pullups are already present
> on the board. It also removes the CD pullup to reduce power consumption.
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> --- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
>> @@ -198,13 +198,13 @@ &main_pmx0 {
>>   	main_mmc1_pins_default: main-mmc1-default-pins {
>>   		bootph-all;
>>   		pinctrl-single,pins = <
>> -			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
>> -			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
>> -			AM64X_IOPAD(0x028c, PIN_INPUT_PULLDOWN, 0) /* (L20) MMC1_CLK */
>> +			AM64X_IOPAD(0x0298, PIN_INPUT, 0) /* (D19) MMC1_SDCD */
>> +			AM64X_IOPAD(0x0294, PIN_INPUT, 0) /* (J19) MMC1_CMD */
>> +			AM64X_IOPAD(0x028c, PIN_INPUT, 0) /* (L20) MMC1_CLK */
> 
> [Severity: Medium]
> The commit message mentions removing internal pullups because of external
> pullups on the board, but MMC1_CLK in main_mmc1_pins_default was configured
> with PIN_INPUT_PULLDOWN. Does this blanket change unintentionally leave the clock
> pin floating when the MMC controller tri-states the clock line (for example,
> during idle or suspend)?

MMC1_CLK has a 49.9K external pulldown, so there should be no issue
dropping the internal pulldown.

> 
> Additionally, keeping this as PIN_INPUT leaves the receiver enabled. If the
> clock line floats without a pulldown, could the floating voltage cause the input
> receiver to rapidly toggle and increase power consumption? Should this pin be
> configured as OUTPUT-only instead?

I think I missed one patch for setting MMC1_CLK pin as output for am64x,
will check and add patch in respin.

~ Judith


