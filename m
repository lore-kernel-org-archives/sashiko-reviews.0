Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795085271;
	b=ZbJepzuaF08CzUlP2BbeX2C29v7F52ONZSQlF7kErRnBDSRvVeAYwkIw7Ffnwr8ch1Y4
	 epnsECsmjptIifFunGqImU8rKBnH4dTmw05UkSqaFX86adDGsUFGf9sYNF+LKjW+rSTKQ
	 DkWJ1hRUbKVYetrNgPQlF6K7Nbb9Sb4uesYAnSyUaeqTwqLbLg071ysGIqcWLZGL/lp6U
	 +Jl/qtkVrMCwI+OUbdgEoumdWBC1t+e7xF/PA74+MwYUzAwIc0gW88vTGnBbDoSndrziO
	 BvRMBsxv4+T3T+FW/HzN/7n2EXKDze54pliGmID54WTMpAVLf27W61wNHS9BT/Gu+HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085271;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=P0YvQzbcOkTwc30bO7gh+i3SvNnUudnqyvG1oHz3Oyo=;
	b=sdLL16xV9rsDFVxpCvz3CdGGOsuOQCbJSgvZsWNMltITknYmR8w3o5gqajxrsdtYeZJZ
	 RJKr8BksNi3pJBZzRjddErcHU8bYXKVeZK3Ra3mzWi6FvDdlxHISMTnQKRPvSvj1DvAs7
	 9teAzUGunRT8Hn/0Hcbxo1UKDMROmDTSdr65cRSsZyrvDZWCdZUjzGfBKk74k/YRL9c71
	 Yrhl1CEgz1trXcDPrrR2eUv9Xkg353rJBnPUdWFhRQX8VT/G5p42hVK/A/Jgf5iZ6Cqc0
	 XVJZySr0ZZQrJZpIdJJ+eWRJk6SFI73u4sE5Sb1Ruvs1PMd7DJRVkyQST9wYfc0FZJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OOd2N6e8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.40
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013040.outbound.protection.outlook.com [40.107.201.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8F606A325
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 10:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F8F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OOd2N6e8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6LxcLjRwfmS7u8S182UmuqOS+KYXBsIiWflfAuUtxKl60NfWALFkyUE65LC8LVcNkuEEqhgfpvCsNCmGtChDrUcPt//N7WxT9LgjuPe7J7yNJ+/2yBgI1dEwy1ia4Arl2ZQXFcf2okIxDF75CRhRAJyQ0c3Ez43zimufXrk48QBtUNZJS6KRBrY3nkY0DVD/NbGM0rp7GR/9wfRpkcOv+FM81gLVPtAbxo+QBLtDb3iwlPijtT+qQ2J/NDq+SeggW/eT6kZE6EKhz0W6sKcDtlXqTfd/QX6FzMeTBmxfTyBQ4wyhFD//+jvBQvlSZpUet5Y5V9VDyq2QMUvnSlcvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0YvQzbcOkTwc30bO7gh+i3SvNnUudnqyvG1oHz3Oyo=;
 b=kSvZANGV0ULS8CctJuI2Qlt6TQsJK6/mTKEsqgNmwArP5R2OH054lBZ+Rbitt4IVI6giPDqHQzjiPrLECmQJEtkQiLxNGy7B1CUZ6hDOSzKHVcjjMSMfj+lDz9Xe0yxKpemnX81sLYnxb9HZTL8i5AgaeptZ9Y6Me5X2UdqqbGHqOnOjQxb436qzZq7RGs9W6nu6pXtBM8fsNQWEAHkNXEmeSRfLlVrU6e6r6oaFoMeR1a0D3MXHMf7PH3NjTSjk9a517ntVW86s8N0uwFW7Yq7xZbpn2XXrclwRJ9v4riHzCtO89lU1rvlrkZT5FKCSu/3X3PzS8BZN7sxt1XdRCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0YvQzbcOkTwc30bO7gh+i3SvNnUudnqyvG1oHz3Oyo=;
 b=OOd2N6e8cGc3/t41I75oRmPwpDlOISw5Z5Xc5qngaysvWpzMGGeafMFMjFoVlds0pol42e/l5s8zhiocmWQEJFyFrOLT/RmvDLMKqQdeb+8UD7SEW2+6C3qTIYoWNWic58JG7uwj6U8JFnFWY+i7KFQVEL7R1E3qQy6U4l8oL9LucjEn0o2XcTlitgsyiCL6GMqiK5GCbbKU+rXrWl3jNmlX8+vAggBEkw6lkqtqdwJh4Z3DIAfL9pVieOvR6fY6bpRwfx8Ha+W29nExIz0endG2J5EBp7rhJL5+yfUrI41dQjtdviCemTWF3+Jq2Avxkjz9P306ZltZcgkkmz20IQ==
Received: from SJ0PR05CA0209.namprd05.prod.outlook.com (2603:10b6:a03:330::34)
 by SJ0PR12MB8166.namprd12.prod.outlook.com (2603:10b6:a03:4e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 10:47:45 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::99) by SJ0PR05CA0209.outlook.office365.com
 (2603:10b6:a03:330::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 19
 Nov 2026 10:47:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 10:47:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:47:27 -0800
Received: from [10.125.206.246] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:47:25 -0800
Message-ID: <8d240796-3c47-4ea5-8e5d-bfcea16a2a8f@nvidia.com>
Date: Thu, 19 Nov 2026 12:47:18 +0200
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 rdma-next 17/21] RDMA/mlx5: Validate firmware RQ/SQ
 state before sqrq_trans[] lookup
To: <sashiko-reviews@lists.linux.dev>
CC: <linux-rdma@vger.kernel.org>
References: <20261117170914.27410-1-yishaih@nvidia.com>
 <20261117170914.27410-18-yishaih@nvidia.com>
 <sashiko-outbox-221618@kernel.org>
Content-Language: en-US
From: Yishai Hadas <yishaih@nvidia.com>
In-Reply-To: <sashiko-outbox-221618@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|SJ0PR12MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be038c0-81cc-45be-e130-08df462a8b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|11063799006|10067099003|56012099006|4143699003|261026140227099003|261028144727099003|261021135927099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	uGv2xJd7vLlVqakvv1Yh3k1BaCpZLDXe0Id9uQcm4jEN2zI9lLw3Yc0jeZeGQz6bV6xeuNw5sUZER7fi4WbKMIrifCkWJReG3N+l2bZN9XJy3kOaIa7p5cLp/7FZtiivTZ6pssjcgIXf4LeTO3Lnkl8qAAhjRz66NaIHeDCXw7y8hYvN11UfWYUmTmokyDkCvxdZr0O1fkYTDyUisqIN23WudMer0H2EiMCkmDkJNj7Ei3N6oG2F6KIKRvDcHwAParSI9hPMvy6aD+pFgLvHaiI0dtn5ztrlsaQUkrobMia9f0TDu9Y4mFGdo2DtJHchcZh7RtSi1l2O+hqkfu2zG0PVyrjCgg0kA9y1iZ3kuIK0+56S62KrbY+1TDFRmtyrmajJxyXxSpgA+YBOw0H3g3icLjO6MhrqzOnfzbZM20jcvCvxMzgPZnGBVGNdTI5SFmQuPLiGGl8YD1mWogy74ffNVu9gklrJUkxUimbt2eZeZQnIiLmnEFL0Mt6tuoiICTDPLtUvjfzAJJtzofKkkcRNwO9c/1Kj527xdIIxU8wQhdol6FJ4HSz5Q3JH6oFYgh2pf/oFrsIlrzcB4pPUZiKruMyLnTuL1BgcUMEWRp//91lHSRc/ogiVPLTbiF7422CsNn9YqhRJx7nKTBKqwxdg47ESMO7qzLpV4eXwcFGRhoQwTL3OYZHGfpap3Y5JhqI73J93fDuYhWaTxzbPag==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(11063799006)(10067099003)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261021135927099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I6l5NP2ygaAXT6S7zViWOVEKByubjHTEpHILh84DSKDeGah2/KcOPKjE3dpdepUyIeygwQN/aYjXIQNZDc6G7OeYjYcbUuLzCfbs7W5d8pdntlithi5jnTsQX5y4fSOVYCJP7QwoxeUrppHty7wxbjecq0RowMg+rxI2Y0k51Qugq1Q6Rs+ZgvmQO11z2W2aNJ08ynulCx9e85Sl/0R7ZvzyvWNO4hovnITXAvWFeQbCYAZgCHAvOW+gJJk6rjk4yaMArf+jWBOvxGYPrEifYNPNRlRw3waus+VggjR/XkKeVGtBXQjOmMscrAVgs/IYIQkeqdLUlmi7Z5ggcy7vMzrsbgouHP7aJXlaaQ/XMjjEfb3j6GK59JpLZ/1v0sn2ghJjyIMMkkGUYyEZ9A+Gct6MBvefnDPlFhFWOGVjYws73PhT/dqgA9EjAOMXEQnW
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:47:44.7653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be038c0-81cc-45be-e130-08df462a8b45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8166

On 18/11/2026 19:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] RDMA/mlx5: sqrq_state_to_qp_state() accepts invalid FW states
>    2 and 4
> --
> 
> commit 3eeb50e819c6aa09e6f32a3af53732e8d4d484f9
> Author: Yishai Hadas <yishaih@nvidia.com>
> 
> RDMA/mlx5: Validate firmware RQ/SQ state before sqrq_trans[] lookup
> 
> This commit bounds-checks the RQ and SQ states returned by firmware
> against MLX5_RQ_NUM_STATE and MLX5_SQ_NUM_STATE before indexing
> sqrq_trans[] in sqrq_state_to_qp_state().
> 
>> diff --git a/drivers/infiniband/hw/mlx5/qp.c b/drivers/infiniband/hw/mlx5/qp.c
>> index 19cbf6b2b979d..05e8e75d734fb 100644
>> --- a/drivers/infiniband/hw/mlx5/qp.c
>> +++ b/drivers/infiniband/hw/mlx5/qp.c
>> @@ -5081,6 +5081,9 @@ static int sqrq_state_to_qp_state(u8 sq_state, u8 rq_state,
>>   		},
>>   	};
>>   
>> +	if (sq_state >= MLX5_SQ_NUM_STATE || rq_state >= MLX5_RQ_NUM_STATE)
>> +		return -EIO;
>> +
>>   	*qp_state = sqrq_trans[rq_state][sq_state];
>>   
>>   	if (*qp_state == MLX5_QP_STATE_BAD) {
> 
> [Severity: Medium]
> Can an untrusted NIC still return invalid hardware states 2 or 4 from
> QUERY_SQ and QUERY_RQ and bypass this check?
> 
This patch prevents an out of bounds sqrq_trans[] access, as the series
targets memory safety. A wrong QP state isn't a memory safety issue, and 
the firmware can return a valid but wrong state anyway.

Yishai
