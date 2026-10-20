Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792498123;
	b=teRSNR/fa/+tXEnQzMl2747Ew4ZSEBDQSO8XuKQiSOQ21NObiRIsQR1voXTcbo1lz1ea
	 H7iUpLzZIukwUsI2/9huV/AsIFYeqgKndpd8Pmzy6c0GW/RcRQl0rKU7PPXtLfAexrZZB
	 5OyHYn6/JPmvitlxdVOLZy96ly8Od/cSC4iXDkU4jSku11zD+oj7NMvbqfEJ9ouszBSN6
	 HEt63TXWDG9nG8VA+TcV9AjbbWcdBaJF1ihruFRsRTBHO0DR42vZ/3+JKCGgGGwvJ/GqK
	 pCGmdDMc/YAloY58QaKuPis/YXE+47cYGF2soomm5JtNH3NeJekhMJOcE6JOUklMbfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=hyc+I916r0kR7rLRw6YX4ZAnDpSH8VQznLB+0eJd3Pw=;
	b=NYXoumjCRKrFUdN4fC6oni1nDx1avRMkMqJFjYBh2dzWM9mgicipmme0xAa4CaWG3qrI
	 9GdDXj0/he2Q9Ru3lBkZHKBvtPW+EBHM/Z1KtgO7r8bsYYJQB7aDZLaKRHbbBLfjJmUTs
	 VOM0lqe+tAcNSz9NcFIt67LoYOUSDfG1jn7gxvCN1vdRJz2tfgHjh+JNFtSNzdT+XMYjV
	 u4n03QdICPqAx52hatWdFEBn7PYXOLtnnZr3X4UdZw41XFLxlH7IUFpMCIrY5LseLuLOi
	 /4Wl9+qMXW4IkTehGs/Z47QL3QpDaleNbPQEAjcfuhbCd6zlXBqg6DW6TGzJKgFJ9Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ECXjyVgQ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=DnNFIv1U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF1D606A319;
	Tue, 20 Oct 2026 12:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF1D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ECXjyVgQ;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=DnNFIv1U
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KB3pra1867189;
	Tue, 20 Oct 2026 07:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=hyc+I916r0kR7rLRw6
	YX4ZAnDpSH8VQznLB+0eJd3Pw=; b=ECXjyVgQcaP4SZXhcqRtAdaZGSdvf1oqF3
	wcpHap7BiDVzGTkS9ywIfUYPzFd2S26xZ39ygrgyUkvrF1fV+FBVETUWJodTBhfV
	zYT9Xo8s2FjT737JI88u06VBUDoI8Ig8ky+VBbI8dwZQ1tkeAFfEv3fh+PmgtzHa
	vZdHjgTnrYVmxAiGCF+BGYOhQ2h2W01gd1+/x86zjkZ5Mv3CL07HWhVsIzLaFn2D
	Cxf2mP4e0w+sPZWYctZawfyJAa8iNo8jPunDufSSkEWKbkTtWq5FwYFM+vUSOjZ0
	3872kaTCVgZiTxkB0mus4AU5/WTx/vernHUOACZrXrRPZIO9lbRg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021121.outbound.protection.outlook.com [52.101.52.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw5b0rkq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 07:08:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDYAM7vTbmJK9MkOAGm345UMiKzUqmbVMlWQ0nfPNv+a0YpUF371DIpT5WYFdaQoPDMo947cV6PtWWQDGWDhtINqQMEC2h586bPnb/0sOIijgQhqx777CFAoWwe6Swa/QmLo4Q1jfQ/AO8ohdN3xvPkNSLpUiji4Mn8BDPftcjcDexw1iwX/j+VQbJmaLUpFI7TDEQRDsbsL26Zy+vAyjlLscSKLyPJK36T1/ifs5rjHgAKYlEUMx4jHrzb5hB/q4hObIJJhETycoZcKpRiOUg3F/npoqXO49Sz8vjZMrY7oK8fqlhCcqol4CqMe7gUKPxUS9sCrdZBWW8ZE2oc2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyc+I916r0kR7rLRw6YX4ZAnDpSH8VQznLB+0eJd3Pw=;
 b=xNGjjj7qcLkyM8Of/fzVZHbzZPWSiGGe8ZqfxC1+02eUYPYppiUpwYKwascB3cO/pfiwyyvlrT9N/OgRE9CfRYbKVqu+y/Tt7SJWv/dMESGL2nhO2itA77s6mU7aUEFrLgUsI6ML3BeZZggopJNLF/ijIEY8mqZfSnOjfsT8lmAsOQLKjmkTeNX6qJsQtsr6W5dcHhyyYRPy0bQmI0np3P/G6T68pGvkNMB3RucvP9t57UwVyQuyE7oMEyMgfrThGnqo7nbkatSL7T70zsQcVS8gQIotOfm4r4t40snZKTLjHTvJ5pSehUGLHi6pC88BPbuoBXM4QYSt17MHnZ1EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyc+I916r0kR7rLRw6YX4ZAnDpSH8VQznLB+0eJd3Pw=;
 b=DnNFIv1UfsBzDp0Dos1ckn6htGIA/KmdmWa+vZQ7e9G0Nkx/roJBup67teoS8xX5aVpexZK6oxzxVWPhB7NVSCtVzgb9Mai9kpVX5SJHy9B5rPuzH9ndk5V0vLYvp3SeiwkCCQKQyU2CBauc4z8mpdeVQoz7IaHoJjkiyfVnUzw=
Received: from BY3PR10CA0001.namprd10.prod.outlook.com (2603:10b6:a03:255::6)
 by PH8PR19MB6713.namprd19.prod.outlook.com (2603:10b6:510:1c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Tue, 20 Oct
 2026 12:08:26 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::47) by BY3PR10CA0001.outlook.office365.com
 (2603:10b6:a03:255::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 12:08:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 12:08:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3969A406540;
	Tue, 20 Oct 2026 12:08:23 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 24DF682024C;
	Tue, 20 Oct 2026 12:08:23 +0000 (UTC)
Date: Tue, 20 Oct 2026 13:08:21 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mfd@lists.linux.dev
Subject: Re: [PATCH v2 RESEND 1/2] soundwire: Add a helper function to
 indicate a device will detach
Message-ID: <atdZte6J62k0QCEC@opensource.cirrus.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
 <20260924120520.2511081-2-ckeepax@opensource.cirrus.com>
 <20260924121706.432811F000FF@smtp.kernel.org>
 <20261020112658.GB1795367@google.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020112658.GB1795367@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|PH8PR19MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: c0107f8d-4992-4fb2-ea1b-08df2ea2d7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|36860700016|82310400026|56012099006|4143699003|11063799006|261009223027099003|10067099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0HcONCm2er6eB/VfJBIS0FZVJKqPEKmH6Tep37MoAyqHjbi9Pfq9XwNZQwHl4Dd6Kigc0XHaCzzUvyd9Py8cZt+xP5SMzVmiVJzMbqPIDhwybYDmp03BeH9gEYawgpSOEPZQL/cu4cDlpEH0T0pc47V2Gm9nbo2ITyGUYmAu6Raga0Cw9tRmOPNnhUvGGCv7UoY9I2N+SkwJxFUhBQAERZBP9IRe4NbaCgR/rg1c7eb9f3cuL4F9QM3HQwHZ9yblwcNeWEKmsIBCIqz8YtFxrY7PMMTLiSSLxT4MXOv5dVtLCgpS7JRM4Lx+kyt0O/+cA6PnIxM/NvapUImItqR6gB31ihaGBArHn4AjZBoDQ94PnrtirSWD+6VoetkyIw7kR8QxkP8CnJvv7oSZQB+EDN79WO1hiodgLhyVLZQZzsx572aHoX939KYBzeFXRoZ1+Bs2K4V14TvC1vhSQ+h7L/QdR565VkS1yxYmRhk3+JCEgf3txkFQqvlC/YKaP1qB5z1rU7fpG24UTSw5Eak+mEHrK2goHEFTdZsL/mjOa/e+4xHe+Q5mHHonLE6flNtxGVOu0Iw7AnP7x77mxHCNWqDrVTPUD02gXcY3B3m5v1sslIR1V8fmuygGywOjqg09z5sj/9TymlxUgJ+Diqna8b+NUuqoSlXZ4Ws2biVdwcQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(36860700016)(82310400026)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	allpPpNBJRCalIT6oNUemdEDIBzT2akpDYGKdg7wtyoXTJBB7PjytSTTGHN8Q6nydT+bhxW/cppXa1Yedxdi5BQMQUJ1yokDKLslJ3XOxYNdxIucYVwoGjbcUHF5+aqLrA22UU8Cvg/aPi1VsybrrGS0XDzKmG9vkt4kv1g+PSZLCusLmn0Q7u6pwkbRNLNijrZDNVyibjg8oqN3+hMSPaBhkerVsUTenp4TOfI10CS1jqXozf6f2a8QdQPCvsjv0mixUrAxyLWEfkio7BzsiYH+xVACgDqBhCYadlcD5fsINOYHsL5ExETeBZGRAuMU8q4a/hGe+zebEY5iBAjBVzSsHf1hgxh7xXctvjTjA5iXa1higMTXHVTq78fKezLZcxSfHthJp4/1qyCDZR+g8cmbUST8hNbncKJuG82YrmoAAwloIKhfNomdlzWzQ/C0
X-Exchange-RoutingPolicyChecked:
	IfqPMVGNuLH1uQVNrITwDZu14ZxhOw1F73BdqmQnl9ThtjoeY9aECCoM+mphdvFMx0PkANzaqA00rKwF/ON7U2qOcvxZo1SoVNNy2suTRUZLCNC++JcPqBWn7sbKpeSTrh0+8rGEap3HEddCOVPZVmEezSUHBziAEL0/Hf5oOBvMKp2F6Gfs1t034FfUuKltkAmP5TYlpAS0iu0Y8T77LRhT5Y62urcOZ9wlubtq+StSaFq/45dyGndpLm8s+3ExLEIh0rtzeOBjP8S88fBNbsg3v6Ailjlt7B7DPY192e2VOBw7l4IR0MXLbvMpPt+wGuv1ER1hKjx67YEMlST4Mw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 12:08:24.6058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0107f8d-4992-4fb2-ea1b-08df2ea2d7c0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6713
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX8yvS5yFwNDgT
 /EpIMI6HVPGf/CNp0a5LzPtIuP27nkrwTngJkDhUJz2Rbvn5waPj7a7BERD1Ykisz7z+AtUUG1+
 B7EJtD/Q/n5gnhdpcpZvveiqqNXf59o=
X-Proofpoint-GUID: mC5CWPV_pe-5ZfivGh8Hxie39xx6tt_M
X-Authority-Analysis: v=2.4 cv=HOlWhYtv c=1 sm=1 tr=0 ts=6ad759bd cx=c_pps
 a=2V5HoZH/GQLctVJeKf1daQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=MN1Swk6Lu81Nv9WeGdsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: mC5CWPV_pe-5ZfivGh8Hxie39xx6tt_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX9NPeX1tPgETO
 WI+E2mOj29d+fIYVeqk1QZB0HYGmSiHQ9lBx8ZFjJIYw0zFXll7mk8Xxf/GCxThKWP2ujutEJVm
 WWURBNo5tTfEjhXvE3In5wyNYE0rWbd3579dzNb13jRjFcqkZIblwUNQCohcIp+9mi0InDkvLrO
 TSdCJwgMECYLT0BlRKh9pPBGX85noNxQR4dr5rQDf10DNZt8rxno1h9GdPL07ZKnLJvTKu8fYbE
 iHpOOP+2x8gRcK5bDd1l6q+toxzsDJgS8SXvtom9Kw2+As9WxqFX67ibQ07vjNmaSVzXHFkk4YI
 uOXi0315m3cDUqnWP8KLJm6xYpa49ns7bbk49NEEppxE2LR7LuwQfxIzX3Vq/V/Y3QmXgZXv47L
 LcMdmlByIxUSSYCrn/CA57abbc10ClK+hgvY/KXALASG0RiKi/k2tHV6J22lQde5WAUET5GLWMK
 B2lzs1CiWjl/eNcWMEQ==
X-Proofpoint-Spam-Reason: safe

On Tue, Oct 20, 2026 at 12:26:58PM +0100, Lee Jones wrote:
> On Thu, 24 Sep 2026, sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] soundwire: data race in sdw_slave_signal_unattach() with complete_all()
> 
> Charles, did you answer this?

Yeah, although Vinod wouldn't have been on either the Sashiko
email or the response.

> Maybe this is why Vinod isn't replying?

He has replied, he acked the patch:

https://lore.kernel.org/linux-sound/asC1SwHb4DZkJ4Pr@parshuram/

This resend is identical to that version, I would have carried the
ack but unfortunately he acked that version after I did this
resend.

Also in this email he says he is happy for things to go through
either tree:

https://lore.kernel.org/linux-sound/asC1kM-aOjl0GYYx@parshuram/

I can do another resend carrying the ack if that is helpful?

Thanks,
Charles
