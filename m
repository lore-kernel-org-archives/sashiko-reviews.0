Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084881;
	b=NJP+LkSWGX5WWv5CLlOw1UYWWmIQNB827zCliY6XCeCNSlwinaU572nrK/urZm0ppr9u
	 3hyFzTni4AI6fQPA5en9CcE6+6YCPxt8CMxJdOtPEVovB1Ko47L3eNEn+DumZK/9E9/mA
	 dxXZ3OCSGRt7N0n9+pV54AaA790nTEGKW6ulCKA+WBqD1SzD+HrvSZrSRHb2XaLo2CgpI
	 oBNtZ56Mqc5uQCIfuvjVPlKJqro5rkf1SXjYXqOhaPLmh8Ws4X1BsAqjGGcPO0zkJuep2
	 iLuURwrN3R/ADDc9lSefUMOOinHFroxaUxFkRorvtCNK/FXN2+0rD4R7y+DMIkwTIsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084881;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KVsx1Mr5OoAG00sUjP49vQt4tvOxlQB3UmQ92DfTpqQ=;
	b=CgjaQgegbEtLW4VJ6AgCO8+u2QQ6pz16vg3UzA9ovl7+xyL/Um5YSADbrL/Jq02/D/cv
	 roCztZvBcz8GauWB4mC1PEvstbG+cnLmwtimVvqyyMKFospPe5zCIgXR10d1gf3C63l/o
	 HAoCwy77jiAiqVNRzniWyF1///P4SjJpHMad7K4zCC7MeUhpEfmNJAWWGtTp/ckPiCW0A
	 GAH3Iq6L/D4TPOzhfXLuJrjDKnLrS8V7jvra2RxUX4zJWyzjWE23WLaWHGKjxUAenJwOc
	 zcEjoorRW4MoMRG0RRBhCNL8zNVPbdkWlLqJkjo6UYNzJWtI0Usx1oYnfnkqRoRhVBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L0j+jMDf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.6
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013006.outbound.protection.outlook.com [40.93.201.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160DB606A335
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 10:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160DB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L0j+jMDf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snGR2JVtihqZLkPXSt/rWcCZLFVP8fyuejMOsGHhMIxkYrSPCKUCCcJAgWesApSCcs0QBkEyTY5BMr72I/IYi8yJW5xWlDQn9eMVxEVyVAuSvOg6dFUbvCA/hm/qjSAjZKOEE/1EnHGy+UtfhsV6yUI3EEbdwlxYnd5QY8Z0/HPKI4Ubt+SqQ8VWWDO/LTfXF1TnR6E9ZiZ3Dizx9DDPBICJVzmRBIX2RPRpIlLBrJrpnKCsfy4hnvZGHXw1dDuAxCdtq5+0tMNVvwxIhjdffuomND5dk51UsLtuIOCS1HUpS8TcD9CvsLOBvmjdvlWJp5g4TuEA3KfUou1pkwg1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVsx1Mr5OoAG00sUjP49vQt4tvOxlQB3UmQ92DfTpqQ=;
 b=QZ4irN9KWsNUCqoaTvZnOb3pS7MzWB6d/EytVqF3w4hvCh6WpWsA4ucTKTiNfiR7+TAfzR0JolZ8OegJ4EYdQ7tPImgFigHh+41br1zGzDk+UqWCIaI58Yj3tmMz+w9htpfYHhcP4Uj2Ja6NviuKS93/bnm4a3E5mTfWc5B49FN6xFZmLYXHmsLsT1UNwVKAzfoWzL56daXocC9e1hNA7ATRGoCVB3IQVrajpy6vjK7R0w4QmCX/Akc/JTVI6VsIQsVTzAbMEVkfotZiHZmlVOFhx5SoIzAOsF1RhZ44eNrQqq4vlzcuxSmtG0gVox0rj1LorUvlQC37yvAQ6C2hfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVsx1Mr5OoAG00sUjP49vQt4tvOxlQB3UmQ92DfTpqQ=;
 b=L0j+jMDfEE5Ze3QSpbnAz6yb5wYkPZkbPLYY+c28NObExWB4s/vkTk7HaCVzouvGy4mtlqNX560VB2Q+XnGN426rJt9cGluVskRmwOEpF2EHxrlhVxM2PSPsvd23fFh8FKaB28fR5Hz7F8b9aGOMFu8NR8TWFfsmR7otVelYxcoJDWRH0ufsKh4iSWIjc8ajdMiFP/CwcoFQRXeMI/rieFIsM1VjAnqKiw6d35twrqUa1grToDjPe4+juA6uJuv1sCSDVMFhKbz5pIjMyzxVgMdJJh1kaxGXTU/D1kynWGl2MewSzXnDb/SGLY7tY93gyQMKEgbn5K1kHV1gwWY6rQ==
Received: from PH8PR02CA0038.namprd02.prod.outlook.com (2603:10b6:510:2da::10)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 10:41:15 +0000
Received: from PH1PEPF00062F28.namprd02.prod.outlook.com
 (2603:10b6:510:2da:cafe::a1) by PH8PR02CA0038.outlook.office365.com
 (2603:10b6:510:2da::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Thu,
 19 Nov 2026 10:41:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH1PEPF00062F28.mail.protection.outlook.com (10.167.243.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 10:41:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:41:02 -0800
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:41:00 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: <sashiko-reviews@lists.linux.dev>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Thu, 19 Nov 2026 19:40:28 +0900
Message-ID: <20261119104044.3044095-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-222955@kernel.org>
References: <cover.1795081735.git.jackyhuang@nvidia.com> <dc78c9c1aea306be5a3c4b06a9a85969b2ee6913.1795081735.git.jackyhuang@nvidia.com> <sashiko-outbox-222955@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F28:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 338ec895-d515-43e7-38ea-08df4629a309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|10067099003|4143699003|56012099006|11063799006|261102123227099003|261021121427099003|261026121527099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+NS11qnHycK2m3WsAnv9Ism/evWlvfA0uswEvNO4nfCkOg0C6ABWmHejIwpc6QKjZvOK6TbZxftd5ypVAAzSdSbxj/IyT41T5IxAdbYhSAOu9D/zXkfYbq/cTDdwsO9vmukSQeMVCD2pV6JWL8J34ADBeSn6nuknU+fNSpOxocgThJWZsvqD7nHtoIMzMTK4tzCyz0F2V5QdD+1dbDqkLKY8KIaw4qkcrDp+jAvJtw7sShgmPmB+hNewvU379S0B9uGSjZt/b1VXc6vjxhE8adUl9RfEquA7x0/9fJCwXXV70qNX9MzLJssmXiPwyOncmNRo9dA4rFrmDcdQyHEpCyq5mAeuvrZLiHZFo6/kviTy9zr4UptjBPV0yKNqqfq71UUTKcbIKVItAkw3ITfwXRMi3jqcCHrMp2r/J7XbvOo024ecpjQQIKRgBYwClLZkPWMpJPSqufJo9C6kIkPPsaD1YaUuTsGqKWtDdX9SAm/+/5TKxLfDO8+IsTwAGAbL1n1X9EkFxX+pezfj9zDi/6qm3lWhSU+g19fLRr6gN1rP6BcybKmuHheKfDG2PXWOS85uO8Rh7Sy7VFelu1N6PtDTu9P5oRco2aCShgjIO3IB+IBfCCIlEVwP8l7EolZhr0k1h/NOnqwAfn6Qeqevz/jc/UCLrWlJYvq/YzlC2LSQXTsRqKaakWb3hC3+PUZJcoDofNELDcDajudsHBrmag==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(4143699003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261026121527099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k9FnbS0vcItXWPVvfwBmhE8sjyTUu+nZ7WkftmYFu3CeHhSy0xf6/NPwc2dHAxwBsbaVgpY/iEifx9E3Pwg4QktBe+78Ag9yi9PSEA0rEibtaRGH7RCD7WNRRbBzTMBDksgKSE5fZ+hgiD0fR10khVpkqZZCTV31L4iKa2hiYOHNrbIn3vZAy1Sv4xXR6Gx/5Nsnbh9ePuoHnppnSAO8xb8zP3q8jPI3VHLgRtaS5pWDBF2W+x1ibpgvKZMD+JZ+ErGXd/ICUYOEtabqQpum28Dbn/WxR3k9BGabmfNlB/9Vnla+g/yhKV+yv8pRiTgG2h4PvZPBB3mPW6wzKWVyAiiLt+LLy8sJhxgb3wGL9dYbF7C72E+gIPnq9+wxQ95rws6ReDF+uyE/Mwc3IxkHlvgZ0C8VuPSHCpIL6XDcfyuK5vexiqwwHSDxCtxrQ3et
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:41:15.1936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 338ec895-d515-43e7-38ea-08df4629a309
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F28.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765

> Will the three pca6408 expanders at 0x20 collide on i2c4 because
> i2c-mux@70, i2c-mux@71 and i2c-mux@75 lack i2c-mux-idle-disconnect?

The muxes on i2c4 intentionally don't use i2c-mux-idle-disconnect.
Each of them carries MCTP-over-I2C channels, and MCTP endpoints send
their responses back to the BMC as separate transfers through the
selected channel. With idle-disconnect the channel is closed right
after the request, so responses can get lost. So I'd like to keep
them as is.

Jacky
