Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB15360EC0;
	Thu, 13 Aug 2026 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635967; cv=fail; b=BcZrzd2+2/AOSk34rVrahiAFQWy8YHe8AHU+jv/FQtov+sNk0OVjyunRHLFTatmXrrR/pE7BggZ+HZIHbddZoJGV5xzvnKIL5nI66xvaYsphEnG12hh7cVybzsigOve9KTVNP3Nxy6PXoFNmqzat9y34C/utVqUCpwuS0oLUUXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635967; c=relaxed/simple;
	bh=RghDrk/cHg21+R8b3l8rMBq5tCkuIeqkONIvSttuq9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BbIjGTRVXKn7ySCHM9H4Ahs2IEeXWvPnRhYFFOk4P28nniWGMPNOBh2UtEptMXKecIhPMgBOVwwdq8EtbQNd7QSQOEXJpu0zxBPfFv8OZJJ00+9IO1bZe7DHBizizholIf85F4uIQ32hFcdqW7uBagn8rOnULqPtsYIbqmTgEDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=i4GnCU5r; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BSdnvRBv; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="i4GnCU5r";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BSdnvRBv"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67DFUihH3286034;
	Thu, 13 Aug 2026 10:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FuZufpbzc0+OI+Hc8LdNHYkzoCB2n1CoJUCy/Sz+y
	AQ=; b=i4GnCU5rv7agDsU8jszI1UA8lfsc94PIVMm6ifSzbfRXUlG+NIg3zv3hb
	FMlFBn5S/Ib85Ao4JRnMya0QYsxzn3MjxW8OIhd8YSKwUJnwkGs3VxcJb1HehmWc
	dO7QO9ZIJq53uSP05MPSbSq/wTPYSpsA5R9cd+S5n9tWXUrMv+bU3+aU4Ztg+cxU
	i7MjLjeEOBKx/Fg1V8soq1jRMfpSgXVnlLxEwDpUvcou73ZHipLVStNMQqOREaGk
	PfgdA0MriZJxJPuOuy6P8eoYcTFSziPCXlrRcCQQk+lqWwsvOPEdS4hRS3zL1pqw
	VfSXZU9PFwg8g3BcnZU3w9M22p4rw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g17mtug5w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 10:45:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4H7CSKZnczkWATdAf77081sxDL/o4nAFizxxDwb5htl4B4Nl9Ijyff95oBGQkAL9U2X1Gwg7F74uJqCnfnMcXcQZvZ4xx48nv38SJAeqh71uAbqhvluX2Q2w/7pQpKzArghJgpCmE8J4WEq1fcCyK0Vt5JcIyrHW9x7cZHOEuzwXrrOM1VYs66ru0XTp7JJ6G7ZrMnTyGNFPOOTD8ScLbUAk2W89p2sGO7jbvBhFV+FCA1WhZdar/4sCjjytNDvORIWe0wnS44bVNK6mo0uhk2i0mk1rJo9/oQJqu5V8L0AHdROLzCbRDU9RzmcCqjrZpx+xREhY8upb4gQjh5Y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuZufpbzc0+OI+Hc8LdNHYkzoCB2n1CoJUCy/Sz+yAQ=;
 b=aIYJ022M9kNW9aAZqiyRCXOjKGM2MLCgLYcaQMwdw0Dm+W9PE2yB1/HS0WZyFN5deH2GKI/qnR6724uxJX7vCAsR6m0v4NpLnW6Du5anyQKCSwepXSjnUP3EetVtrE/kHKO0/2VRvSVPDTfIFvGGdDfTAiyX782dytwS57IrLNg6HYahoeIISGj58MBm53HKI1PQ8n/su3/DJ5Vse7/SDe4RS0LmDMAFj22z31xWEt3/Oc5DA1WSkd/lQ8dkO3Bq7S0HT3BKeCRs/C/mwt6BQegaOXUoC0wDlOAEm154QW7xmimp0Koni9Kvv77pA+2YfPFc33XMU/U2ARkqhL8ADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuZufpbzc0+OI+Hc8LdNHYkzoCB2n1CoJUCy/Sz+yAQ=;
 b=BSdnvRBv/WKHS5gYVPRhyOuC9xxHAUxb12FUo8elL3r2jBBuP6McDYitznh2lTPA4KBLTiaWP3JRZWd+0gNTB6PPAEluy/LUGjXHECa/J14BquC8H4EhcGH/+nJPS2JQrpxZoJzeVKXYtlEZtPpz0gT6dFuBe5uTP6xlxNDVWlA=
Received: from SJ0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:33a::6)
 by PH0PR10MB4535.namprd10.prod.outlook.com (2603:10b6:510:31::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 15:45:43 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:33a:cafe::7b) by SJ0PR03CA0001.outlook.office365.com
 (2603:10b6:a03:33a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 15:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 15:45:43 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 10:45:36 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 10:45:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 10:45:36 -0500
Received: from [10.249.33.100] ([10.249.33.100])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67DFjZBe1104725;
	Thu, 13 Aug 2026 10:45:36 -0500
Message-ID: <278014b0-cc23-407b-ad13-6e6860d8564e@ti.com>
Date: Thu, 13 Aug 2026 10:45:35 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as
 OUTPUT
To: Francesco Dolcini <francesco@dolcini.it>,
        <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
References: <20260813111238.56892-1-francesco@dolcini.it>
 <20260813112458.BA9481F000E9@smtp.kernel.org>
 <20260813132230.GA63265@francesco-nb>
Content-Language: en-US
From: "Mendez, Judith" <jm@ti.com>
In-Reply-To: <20260813132230.GA63265@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|PH0PR10MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: d4fe0846-3c65-47e6-c866-08def951ef59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|30052699003|1800799024|376014|56012099006|18002099003|22082099003|10067099003|3023799007|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	vA9PzVSpqRMzuwn69W2IL1WjBzJIcXRi8rmSB20PSA/MIOZttenA0S7alkkc5qACyms7BTe5f4t1UyWOnO8PgwCcarDKbzTeKBOoEex32Vw/pBVE2Gwr5Lromb7ua7JQnVVnTlCrow3LUt/QyZ2f1tASXFxE0W3rW5ektmc0nLkto8MQxpx/wu1SYz35hwTZPckaYxw6sQYtSrFUNNEso/N2FSShwjhbTavWsANNYEWKdCW/VTAw97CxJjfNfm2fczKLkoOPJPj/NTRxBsNTaLANbgUPzZivMNl4SDd43qwgkI/ZPl1dx4bJJD+JyzDEUgJ413M59ueFcWgfiGGdR2CgFZqaMekiuIdsE2Blr2AxvUewPW8nUryWA/Ib29kULtGPoctFvmi7uj+VacPkGjwoj5ocDrzt0Ie383A2ruXQjEPy9FzQ8bnE+nzTm8MBHpFirNQ0Pbxk1eNbotQ3Za3b2z+1neHmbHl+GrGTqhfbHlQoos4YBbnkKItjzIkG7kgl5eQ/Uw/B9214sIbmOm23a2O+o5JBYQxQJ7IT2J/HyaeDXVgP5j1L+SKZzmf1cS73kN08pyHdT7omElXkQiBciVN5CVftKEtRWT8H10XM1Lt31muOQ2pGwrfwKVjNN1QtSW+0MFylu+wq3wsq4+W+DaU2WPJyGV405fQcQErAEo/QvS0L9b6EJVd6gZXhCu3ftxCwtnxFK8wYQWUP5Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(30052699003)(1800799024)(376014)(56012099006)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tMS1VA/47RRK+SdTs6KHnPt/vmQtOpML4b/dUL2IIRQ7zs5ZuGxd9Y0OCOIQ4v9jHqHrQNf84LuEdoXKZA0ZfUfKa8FPye3FaUwa3ZJPKGhLUjh3ViboLith/yTlO9M31SsXOcbKXYYkHgRc61h79obdGfDyP/GuVbzrdZ0MhPTwXDLW6jCBc8nlqypamgs/v6HJAf8DaC/yVLBrvK8lembee4SsVcle59/AAfJAjyMaLg/sf59Oe/2xzCgxB4ODvz1N8Rm2rwF/CFzISfeO5zopXLGhDe3OcMlPBjR9Wy6mLcroLAbFDZT3CdtP7doTeG1RhwT7dslCIg/7qbE01PGUUfIYvpy2e6DfNfmSUL5xpPidfmyvAbpdwzvStEMpR2D3UfC/q6e6NSgZRyH3kLQXPXUf/LA9bd4FOE+S+8ePiiNmIoIni3oVCe0fEdZZ
X-Exchange-RoutingPolicyChecked:
	ZvkIK6/LiRhuEMKJBadKkVtQc0LUxKRHmrJEuBqfGNF/Fi0X1CeovIZlNXssoJxTVfMa7sF51VhGXwBDTgOmR5e5RZmA+Fv+eWRP9nBtW23d/NEtKZ633vAcsEDUL8lor4Rh+82xewG2pqpd3dZqRKyCb7yYtiNE55izjhMNX2rqLbpHENjrJ8g+q5QTWJibV/EgOftjcBOoRJTCljS2COd6qWmMP77exKSt0A1UzYkGtXJbw6tkERjgYMEKvPyfYWIpyQdtcZI8EQ9X2JbvxpzmMOG1z/6nVErdQwD/F7GQ2Cfz7n+qjE7iZdXEvE7nGY8Y2QdCgJwzz6aNj8LQ4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:45:43.5158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fe0846-3c65-47e6-c866-08def951ef59
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4535
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExMyBTYWx0ZWRfX/sk8ZLl7f/pA
 IsPlcNFWRU4wbIQPnlfiD97xVLffBQH3Xn77eyNE+7KWGjCFankUM2aClv3gefUKCRkCG99M53j
 I35Rpn1250fJUn15X20B8eYRuszHiWvq8d1O/aMGheNtSF9C1hO/5KfPNF7qup7zweXmK3ukKa8
 I4hoBXzXZL99RY44taTN65GjdhkCcmz+9RfcQqLlYddG5VRJ35hF951CzN43LEQSIWgJBfE3cMP
 5I4Tkp4kw8BTrpd32jxSw6URJffA9o9hre19mMiorU8FPk2voiAPBTKMwVZvXHZpQbpjbExk3k1
 UPBYodHi8i70YA02yZZvumZ1QQxkmU4TAnDpI7Jy8JAJwU8a0d1DUhLxDsw8Zbx2hE4yQZPyw0Q
 1ifqXL0gxREsI1os+fu2VuFqAxc2QIWr36L983zOq6HEHF9gsNjy2WqgDdCjuFiKkVjfe60egq6
 vRRM2nSqLuUhYxp4tww==
X-Proofpoint-GUID: 4OH5LUqXbOnIfn7uNHGca7oS1_bE9yXp
X-Proofpoint-ORIG-GUID: 4OH5LUqXbOnIfn7uNHGca7oS1_bE9yXp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExMyBTYWx0ZWRfX/xQLsQYKWeJm
 ZhcWKq9+qUxPEoUfXgQKoVbyK+vY2Gnqco8JhlUVaL/494PnqyZrxW4gambK85Fw7iLEhLFjrj4
 Hg5/Km6Lv8B9twSp0QfEHIiIrBlOCYo=
X-Authority-Analysis: v=2.4 cv=boZ8wkai c=1 sm=1 tr=0 ts=6a7de6ad cx=c_pps
 a=7zLNS0vNT/Ole769MsF7+w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=m8ToADvmAAAA:8 a=xZhohg4tJJ2UE0AP9ugA:9 a=QEXdDO2ut3YA:10
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130113

Hi Francesco,

On 8/13/2026 8:22 AM, Francesco Dolcini wrote:
> +Judith
> 
> On Thu, Aug 13, 2026 at 11:24:58AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [High] Setting MMC clock pins to PIN_OUTPUT disables the receiver (RXACTIVE=0), which breaks the internal clock loopback required by the MMC controller for read operations.
>> --
>>
>> --- Patch [1]: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT ---
>> commit b7e315f9edd8f485234748a2f8e267539b5b0f30
>> Author: Francesco Dolcini <francesco.dolcini@toradex.com>
>>
>> arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
>>
>> This commit changes the MMC clock pins for the K3 AM62x Verdin module
>> from PIN_INPUT to PIN_OUTPUT to match the TRM documentation, effectively
>> disabling the receiver (RXACTIVE = 0).
>>
>> Link: https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals [0]
>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>> index e97b2b047d104..895b1b7dcac71 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
>>> @@ -573,7 +573,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0)  /* (AB22) MDIO0_MDIO */ /* ETH_1_MDIO, SODIMM
>>>   	pinctrl_sdhci0: main-mmc0-default-pins {
>>>   		pinctrl-single,pins = <
>>>   			AM62X_IOPAD(0x220, PIN_INPUT,        0) /*  (Y3) MMC0_CMD  */
>>> -			AM62X_IOPAD(0x218, PIN_INPUT,        0) /* (AB1) MMC0_CLK  */
>>> +			AM62X_IOPAD(0x218, PIN_OUTPUT,       0) /* (AB1) MMC0_CLK  */
>>
>> [Severity: High]
>> Does configuring this pin as PIN_OUTPUT disable the receiver (RXACTIVE=0) and
>> break the internal clock loopback?
>>
>> TI MMC controllers generally rely on this internal clock loopback path to
>> synchronize incoming data for read operations. While the TRM documents the
>> logical direction of the signal to the external card, disabling the input
>> receiver might lead to eMMC read failures and timeouts.
> 
> Judith: is sashiko right on this?
Changing to PIN_OUTPUT should not break anything for you on AM62x based
board. By default the input buffer for CLK pin is not used, CLKLB input
buffer is used instead. CLKLB input is already configured for you by
default, you should not be modifying CLKLB for MMC0 nor MMC1.

This logic does not apply for MMC2.

In any case, you should test once. If by any chance something does
break, you modified the default in emmcsd_io_clklb_sel CTRL MMR
register.

~ Judith
