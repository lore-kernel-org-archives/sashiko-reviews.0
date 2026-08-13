Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EAB489862;
	Thu, 13 Aug 2026 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636738; cv=fail; b=bw1zZw6qkgtqwjV2x7qk+ztgzZ/7jKRWbNdIRp9jgAtGiNCjOnyDhVqbv2S8FqgqrJMUlRuhYjM9X+3aetIiPVdNwt26smLiUPqkk6PcHB9aw9cRi8e3KantiLS6xzm0rFo9hFWfEquCQgK8BSaMqYtIp9s//glF3Q0hmt8wrJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636738; c=relaxed/simple;
	bh=iQw1Buu1whGSOrtPQl6tNOoBaFQUab4PLfLk8IwIP/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DgLn+vPR/ZFuqNAr9oP4ogxQdP6iUGqogPX+6YqCLhLv8R6eUvslVWjRT2DgBxmyr5mRFKFY+okqYjo73PCASlVvdq0nAckZUfaqjw8iQO+eSt9EmJGtVcad3UTL3CI2QRxgzZg8z2HYS9ImBiAlIYOoJGcY7TE7wOQp+6oB4+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oATGHjsY; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I7RlWuNl; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oATGHjsY";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I7RlWuNl"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67DFUkOM3570757;
	Thu, 13 Aug 2026 10:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=siSxYPdIAsBfSauiIou1foGcdgsjY7/KD/4/vRSWH
	aA=; b=oATGHjsYTWj0/spqf83YDB7ScAoHsT9aztMNhnV++HnYYWbpPBzvp52Wh
	lDlovEF7VA7DvwfxU+4LVMEwSZhGP+i810dXOwoGSL7d7hfE/r0XlvbBObpaOqn6
	isHl5o5jA9J28GO88hQnrk5AenTqSkFNxWc/1aOIPYvWpgJoBBWDgnN4tO1dMy3X
	etiJ1loxJgwI7tiRW1yrwMlBxTN3sjJoplCAUu24P3llpiNsQLCLmcQioASwy0El
	XYipLRu3SlQd8OzsXrbAL2IEousag8ez92d2+zaPSOBEAAQnXqcgGZ9Iw8ktDRFW
	OYf5vOJe3txr6BTXlNsw5MBrkW9iA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g1a67jr9e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 10:58:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXccy/c54Hd/H/TbVIzxmIkDmUbxDbm66aiZYB3oTQbClattIpm/SkXBzLSKhAswF7zTf6j89VXKCht0QBfooijEKz1tqTGQXq3UvqGa8aSYBxbyHMk81ZZoJSVFiObubob+c7YV418mkzPFqdDcYTQ24XEUmFS7JMaa406Lc/0v+jTAIwqG4gHft8JsXv4P7/I40B3hfnzq33mDhDnspFyetKFArFdojqk4Ih6+o+sFYVgmBotu398hFV/l+yWnOl6q4CrvgE3lIH/OdpZ0iMYIN8BQ/dfZ/sYR2A7eZ2oQzWt4+rexK10Ts4n71kvcBd3neS2X6/dCYHYoPf+8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siSxYPdIAsBfSauiIou1foGcdgsjY7/KD/4/vRSWHaA=;
 b=ScejPssUa8CpYtXImODr9Ahyw3763NbEAjv204C5FQ9xR4Hjx2fk64YwNNWl5V5hcMLlNNvs9DI/zpbQBjkYI+MBEi+ZRpS9g/bio7RCKGctD/0a+UmAu44nconQS+6oUQ8XAyBzgZXjdXE7L7tsxVN6Ec+2BZ56R4xTDUEXvjtil1+lbcL4kOghEUIEzJXBGJnm0KqK7j7OUhoelgFCwzwppCBW8uNhL5l6GVkgivM9P5HRse5nK238j0Co85frLSbMM1vn5SwnO6nS6SxtzDWqLcIVdj8LwFdwNdoJhQb8dtcFABcysS0fZOe6FZuDIwgajX671Bo3OjumJeW6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siSxYPdIAsBfSauiIou1foGcdgsjY7/KD/4/vRSWHaA=;
 b=I7RlWuNlpqR+WVIS+VNDfIVPTYQ3U7PwFa4e+rCLl8NTzmVe2Wi2y8UdpRN5u11xua8WQNJcwLcGu1lvUs5niOGs45nBAb2lvLNwPpt+80gZpiHz0kSIsPtN23WNaTlxfG77iV2f73p9x/e2peKFpG1cSe3sPxYtxbnZAaMLnbA=
Received: from BN0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:408:e7::22)
 by IA4PR10MB8496.namprd10.prod.outlook.com (2603:10b6:208:561::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 15:58:41 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::1e) by BN0PR03CA0047.outlook.office365.com
 (2603:10b6:408:e7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 15:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 15:58:39 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 10:58:20 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 10:58:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 10:58:19 -0500
Received: from [10.249.33.100] ([10.249.33.100])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67DFwJ1w1120163;
	Thu, 13 Aug 2026 10:58:19 -0500
Message-ID: <d73d0235-857b-4191-9f52-854dcb9e152b@ti.com>
Date: Thu, 13 Aug 2026 10:58:19 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as
 OUTPUT
To: Francesco Dolcini <francesco@dolcini.it>
CC: <sashiko-reviews@lists.linux.dev>, <devicetree@vger.kernel.org>,
        <robh@kernel.org>, <conor+dt@kernel.org>
References: <20260813111238.56892-1-francesco@dolcini.it>
 <20260813112458.BA9481F000E9@smtp.kernel.org>
 <20260813132230.GA63265@francesco-nb>
 <278014b0-cc23-407b-ad13-6e6860d8564e@ti.com>
 <20260813154714.GA89702@francesco-nb>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20260813154714.GA89702@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|IA4PR10MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d5e7ff-906d-48dc-805c-08def953be0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|22082099003|18002099003|56012099006|3023799007|13003099007|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	F0J3XkFtmE9jRg3aemExX2Nx352sozlFCJr+bERW/mx+gev1gufGJwGfjHGxEvtmVT76Pm2AGSX4uJWBfqiRqKssRAng+Icjcrj1WAIYJPD7QddkCvzgy7xZtE5916EdxCiebkBqz9vHm9bklvY+SIC3s8N5lFu10QAitPTRZJjuu+Bn/6e8Wwg8i6z3HjfrYuPvovm3FTBQdZI+TEh39azedxSFfYu9X1IcG4Mf8L4tw0xDTsdV6zik0vjRf1xJ/8c5Tl0R3b+6Eg8IYjv/giQgb9YDJP/zyGi+9c6kyDjqZkPyMEsSxUlAmrsR1V7V27JbY4YhQb8bgIimRO2mLQtUwxvB5u59uDbc9W7eDwIU3l3vc4cVOBtJiwF1mqn3B1qbR5DgC/Lth916/DHAswH0UZtJ1Ezin8OuQbUiKlbuVj7cYX2Ym1iVj+PSxTNRr71qiVauRnUJ4Bj8ZqeroygUBJgcSBSBNeb/Z8lyNAgpzlljXSXuraWDu7pLS06hNmf+DnrgcWjTw71+jzD2Q2akXr1bZWy/TQJ4D5ePQaSucbSjLMOj/BA1UBeqLys6x65RjFlXfYmbh0epSrkz0jHs8Dbr4HlCK7yTUO2EmaxUEY2/uy6syVu5NcSvO7YwvDY195sGbM1dpDCLgZhv/Fc26XBZaRq2Fu4sUVliteuhwoatADHlSyc7LwhWgo3+yuPAwd9xRLMaN2bSiZPv1w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(22082099003)(18002099003)(56012099006)(3023799007)(13003099007)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W/Ny8w2NlEwazb9l49UEpDx80c45nm4ipOhaoY0Vpf9y98v6RRnqs+kqmjZZnBHyI2DvCucrrHIc+QBm/BG9/udA/CDMXKfd+sni0bkNQlkS8aQ2Ma4XUgw3c1Cb+25EUBRnYyXYsx9ImTg3vYwlIwIrdhhgpaIjTHjvGpnf4//fqWmHO7EaxBmyIperh7AIz88vDGC8LD8xH5cj1FaB8oEfqcnVAUkdLZ6p2islqcvweQchHE/Cz/3/9FrmEYUczIH0nwxgK49lwLc70CdPqNniNlCeGdwJCWGua3VejbDpKSJK1TGeOcO4xWfLM60QK/tw4hoXTmD2J6EGm0E2HT9aHbYDcrNSXcIqOECxkk/yHz3nNIZRUGG4sYSrWbQqZJWhGWJWHijQgJl3VTBPpZxqb4YOsd4XWyulh7I+ViPUCtUfrigbdS6ByJJA1O1S
X-Exchange-RoutingPolicyChecked:
	i8PmuhcHSmD4dBWv8FPH1XwLEkdTCyHj9xmmkzrVO+/FhV6B3kvEQZFdeXwfmGbHMOLDc5sElCpr0KU29W/Y60YpDiUZo2IH/Hf4DA0ekoAR9ox9sQYJkVOD0cQEqOuXZ9syeyMYGHEno1D3WjQWoHcbHXdzQo41jB7RitjdEVXVNVC1umnD+/jFqm947QMTACli86CuWgDwYdIJEWLchxNPfBkw2cN5m2yNbl1MaFacXX+ss27vfAzNxsgrX+gFJgpiTU8tWWqHgtxCpxTRELvHuiW3iHAOXW4i8Wu0GWETXs1S+Qh2Bz7NxNFyA+NnAW1d55hB0iD2DfeQ4pWjVA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:58:39.8214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d5e7ff-906d-48dc-805c-08def953be0e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8496
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX0PBlVCRjQ+aF
 N9IVCGEu20aM17SZPDle9TFqTPgYhEUOMxhkmyY9Ph5PEHXGGGPcJ7n2ysauJ6pCiQ/zLeNrlJu
 N6QnyB95f7QKAT+C/EPWJHFwQC7yaVGswY1AA0Y7sGZ5UOi8NHk0fwfkunbag7x0V6jBYbRKiLI
 Q8ZRYIhH2Fdl1X/SyLYnY9Jhq8GVdfb6C0dyPh5PzhVQHoFIgUJWm5BIlDgiNeoquRcbwnquBs5
 VGpmLHJ6Y2aoIJqD9xUzHokW/3zG9UQraTok4kbGp8HS1AbrRKnL8/DIDwYhUt9JfZULJNydyAE
 HmPFPenAjNxOX2zT/rJlDq4Frj69n2YIhYD0GfFRQdJXV3Oj8OnnW2sBTwqbmGcuN7Z31n9yaOb
 0bRK9SNgcVCsTc92x4r31/Ivz2cwG4AGc//nQDx8hNOcKoe5Q9wY8A6M0gU+12LN7AsdQES1bTZ
 HC4Y5BckM6lTp6Bd/6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNCBTYWx0ZWRfX4Wl8h+KjJvJn
 61hjxaqRbrrSdutv2AEqtvCkjDgsxYXlf3LZJMMoZlQZc7qfTIaD86eSJiE7d1+9M62222WgI2g
 GEQ5ADGSYmtFJbrps6Ut9GNL3QfRNws=
X-Proofpoint-ORIG-GUID: RtTcgo5ZQKd4NImwoLv_0KbA1gT1e9QQ
X-Authority-Analysis: v=2.4 cv=D/J37PRj c=1 sm=1 tr=0 ts=6a7de9b8 cx=c_pps
 a=nhquEFRPp8Cuo1IKRjcF3Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=m8ToADvmAAAA:8
 a=-2eGCv3Q0r1m5vlWXZIA:9 a=QEXdDO2ut3YA:10 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: RtTcgo5ZQKd4NImwoLv_0KbA1gT1e9QQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130114



On 8/13/2026 10:47 AM, Francesco Dolcini wrote:
> On Thu, Aug 13, 2026 at 10:45:35AM -0500, Mendez, Judith wrote:
>> Hi Francesco,
>>
>> On 8/13/2026 8:22 AM, Francesco Dolcini wrote:
>>> +Judith
>>>
>>> On Thu, Aug 13, 2026 at 11:24:58AM +0000, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>> - [High] Setting MMC clock pins to PIN_OUTPUT disables the receiver (RXACTIVE=0), which breaks the internal clock loopback required by the MMC controller for read operations.
>>>> --
>>>>
>>>> --- Patch [1]: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT ---
>>>> commit b7e315f9edd8f485234748a2f8e267539b5b0f30
>>>> Author: Francesco Dolcini <francesco.dolcini@toradex.com>
>>>>
>>>> arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
>>>>
>>>> This commit changes the MMC clock pins for the K3 AM62x Verdin module
>>>> from PIN_INPUT to PIN_OUTPUT to match the TRM documentation, effectively
>>>> disabling the receiver (RXACTIVE = 0).
>>>>
>>>> Link: https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals [0]
>>>>
>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>>>> index e97b2b047d104..895b1b7dcac71 100644
>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>>>> @@ -573,7 +573,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0)  /* (AB22) MDIO0_MDIO */ /* ETH_1_MDIO, SODIMM
>>>>>    	pinctrl_sdhci0: main-mmc0-default-pins {
>>>>>    		pinctrl-single,pins = <
>>>>>    			AM62X_IOPAD(0x220, PIN_INPUT,        0) /*  (Y3) MMC0_CMD  */
>>>>> -			AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */
>>>>> +			AM62X_IOPAD(0x218, PIN_OUTPUT,       0) /* (AB1) MMC0_CLK  */
>>>>
>>>> [Severity: High]
>>>> Does configuring this pin as PIN_OUTPUT disable the receiver (RXACTIVE=0) and
>>>> break the internal clock loopback?
>>>>
>>>> TI MMC controllers generally rely on this internal clock loopback path to
>>>> synchronize incoming data for read operations. While the TRM documents the
>>>> logical direction of the signal to the external card, disabling the input
>>>> receiver might lead to eMMC read failures and timeouts.
>>>
>>> Judith: is sashiko right on this?
>> Changing to PIN_OUTPUT should not break anything for you on AM62x based
>> board. By default the input buffer for CLK pin is not used, CLKLB input
>> buffer is used instead. CLKLB input is already configured for you by
>> default, you should not be modifying CLKLB for MMC0 nor MMC1.
>>
>> This logic does not apply for MMC2.
> 
> What do you mean? that MMC2_CLK should stay as input?

Well, there is a reason MMC2 CLKLB pin is defined in pinmux nodes on TI
boards (: By default, MMC2 CLKLB is disabled after reset unlike MMC0 and
MMC1. If we do not enable it in software -> PIN_INPUT, then the MMCSD 
loopback clock input would not work and your MMC2 would not work.

~ Judith

