Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023091.outbound.protection.outlook.com [40.107.159.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B37397933
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.91
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345709; cv=fail; b=bD5pe750euhKyUXSdJKRbEkg1kO6f/BoIEwAzX0PxM+3Dn8PZ+4p/1qfl7ZgPOzOMyAltvnJkkp80LtaSSHuE4b6KuP6p++gynfCAQbiW7xR9+So5BH5FxXSytmY23pcjW2rkyTKcKtfqq6h4L27mTBUwBc1tHXm8BgG74LvcyQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345709; c=relaxed/simple;
	bh=ITIvDaHUlSK/f8ROP6pkQ77HHwhAcpXbyoj/O3Cht9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gWQ82mdCV/IDyyYUp6OxoH21v3dP1VwM9MweqZoRqAeUcyFnt56fpj62tlkZoyrVD4kScim/P11EhB/pjOOgaWAwAuO3h0/mRuJpL87OUjrO1u2/t2//U7NJ4fC78h9AUkoN3TepVGYqVceVdghEkwoqFuvU3dfEfq/pw+pFjuI=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=KLvIpCsI; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=KLvIpCsI; arc=fail smtp.client-ip=40.107.159.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="KLvIpCsI";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="KLvIpCsI"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eo2Qh2zy+rHyvROln7Nuy6DZmnmcr3m6iI/5kWH4L+1B2p8J6ouA+z+14d7tmK88OSNg84xgzthr7NtwGYegOj0wtoTLE6g/YN2mC+bBH6dwFYOJhiUbawzSWdTpzo3bj3fyPycR38Uoz/yHAqwAvfD96T4uBjmAX055zaTBBJEJVwhKEC8Pl1b5ia9kSMyJKin5VmiwIDbtXpaQ7JHenWcaxSdg0G1JgsCdcvBJiRxpB1nyNYhoFg7DLTq25mqY20CgiTWDqzhv6IK+m1b95iHpzZwXeNVKL8sN6rh69JCAnE7rtzC6nafCYqDBjx7UbNlKlQPPGyvXjObLsXAsfg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITIvDaHUlSK/f8ROP6pkQ77HHwhAcpXbyoj/O3Cht9M=;
 b=nScFKXqI0yTuCdZd/DPclm0Q5nGjNcteQR36nUlmTLZFXrnvmlemW9fQk1NQpI7OALoP46Ja2NN5omm//o5JmjMoPkU9D/+8PC6ik5LDN7lWAPg5E13Cap3Pd73fNW5Sdv4aFyilSE++rse3oGVOvz3OpMLqd894FaBHJ8YNKS78YPaK+CTLl+vd4V6RurKkXvtg5ahkEiQ7+QO60aoCNAGF29t9Drnys0Ji4WE50VFi5YKB/8kSkZ4kDsJH+uF+QJtTo7S22yLNv3t0+wbV5CUwSRM9ta9XCPYFwFG39BTghJ+dHDZ7lH97cars8D4Tfpi6n4F5LZ8D7wWNVO87ww==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITIvDaHUlSK/f8ROP6pkQ77HHwhAcpXbyoj/O3Cht9M=;
 b=KLvIpCsIN7K/5onYDA/cAB5qbqN+MdyBWTgm51Z02FdZFYGyghJf1H4oIO+skJJqtY9pTieVTE4mTAdkX7tJY/2xS462pJBgJ9Z7K+9QG3Nx2/rsNzj8vL2fK/DEtXsSprJa/ifO3SRiNtqhE8hpEZRzIRzbzmHwdPVQEedoUR5TNd/sRdugbFUOqkc8FcmKGGn5X7iaf8RBehMvqBP9Qp9Cxyg6VvFsr9T7W/77Mgv2ktoNZ+s4NH0nSnjGQCSFbznJSrTWoXniCIsV9c6LpmygCDHum/Cak/fgmvjzG1VejCtcqJkKZ9GDtCVbdLvy7xwh1vgEISyvL9kzunDpng==
Received: from AM8P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::27)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:08:22 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::1d) by AM8P190CA0022.outlook.office365.com
 (2603:10a6:20b:219::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 07:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 07:08:21 +0000
Received: from emails-1328467-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-814-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 96E017EC26;
	Mon, 10 Aug 2026 07:08:21 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon Aug 10 07:08:15 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786345701;
 b=eonF8MgIU/TULn4MRr4vY17ii7mtIXomKlHOZlHFvYCJ3YEzrmtXD72nmtwrqE8o+bpro
 DMIyX9OMl1pPOVwt3h4Ur+s0l/cU4IUNokN9x654XCX/0wLIJlj+8A6Z9Rr5FdN/dJ8dcXl
 Yf+nfvREe3fxhg9sHDp4UIZR7AK3UHw=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786345701; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ITIvDaHUlSK/f8ROP6pkQ77HHwhAcpXbyoj/O3Cht9M=;
 b=EJEPSmch5LRr732rZf7j5sxkcgQa03E+jjV0yUaH7b/l74ix1Zx9XWaJM2DHjt20Ei0Y2
 CUh7+opc2NkdAkaXPdLk//uAqadcDME3JQVieeY4/lkAxOf5oQ/SkKc6Ro3cATl08/Q/8PU
 ApsgDCqvqF01P7PF1yJDRQ4rckxMUYY=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITIvDaHUlSK/f8ROP6pkQ77HHwhAcpXbyoj/O3Cht9M=;
 b=KLvIpCsIN7K/5onYDA/cAB5qbqN+MdyBWTgm51Z02FdZFYGyghJf1H4oIO+skJJqtY9pTieVTE4mTAdkX7tJY/2xS462pJBgJ9Z7K+9QG3Nx2/rsNzj8vL2fK/DEtXsSprJa/ifO3SRiNtqhE8hpEZRzIRzbzmHwdPVQEedoUR5TNd/sRdugbFUOqkc8FcmKGGn5X7iaf8RBehMvqBP9Qp9Cxyg6VvFsr9T7W/77Mgv2ktoNZ+s4NH0nSnjGQCSFbznJSrTWoXniCIsV9c6LpmygCDHum/Cak/fgmvjzG1VejCtcqJkKZ9GDtCVbdLvy7xwh1vgEISyvL9kzunDpng==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:08:11 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:08:11 +0000
From: Josua Mayer <josua@solid-run.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v5 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Thread-Topic: [PATCH v5 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Thread-Index: AQHdJ94ez77bIT6eWECzaURBXXkxl7aVcs4AgAFrdgA=
Date: Mon, 10 Aug 2026 07:08:11 +0000
Message-ID: <53def40f-1840-41fd-be7e-8b017fbb2aaa@solid-run.com>
References: <20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com>
 <20260809-rzg2-sr-boards-v5-5-19c662358e36@solid-run.com>
 <20260809092718.BCCCD1F000E9@smtp.kernel.org>
In-Reply-To: <20260809092718.BCCCD1F000E9@smtp.kernel.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|PA4PR04MB9688:EE_|AMS0EPF0000019E:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf26b7f-cbdc-4052-56ad-08def6ae29c5
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|56012099006|38070700021|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 BsfUFWGDfNgIhBB8LUPF3Xo/z0u2S2MHYAjHo0PIP9JJfpGPWhRFEE8LiBIXkitDnzYMB6DDttTHIOphFfXsYpa0uu4a3+8QmDYlUqynWCyo8clDB/RhvGDYln/bS0CpBUhJY5lFrOOTfY9xs8GtfeRzYNk25P7GqHSiM4s//Z0ETR1RlXN7B+P8Rz10by7G0tlUIfTKnc0K5xZLhg8b14tg8nYmcDmMsa++JYhboPfSFRXKr7KuJU4vZaFasWZK9Y5YxaC3mPgrSRUv9GWaF5UWOwuYUfLqneWUmn9dPQfREke+pJ9YnmFHgJXjJ91rlhXcaGepDvuVIN6p0HR9xZIowGPXFcgYoXQTb2kFUBuLzjkTdO12+n3VCrk8rDJzf7Lo9En3SJjWJOvND0NFjlZOCWC+hCEtTjBjRwgClorycSQwQZ/G3p/7Rcyx4Vcyhd1ScL5n193PhAMjyq+QmuYNqrsUarkJVUG5Kgs0NPdJip3l0uJ0IzQZ1YNzTF9+mqxKK7yVVoRsWUry+0eEwwXci8JdTrA+2oY/GF7/Lu9dritDta6bSga4KABZ3HAqM5xILV3zM6ySMLtAi44u1aVOHo6wgt52JLiA6W/jQ7rfHPb6iHgIPrMDU5urUMFyY3QLWeu9lAjg7JggUbSd5MTZlbu2br9TJU0NmnyjhHJ6Sv2iy7XgkU7tWq39gmllqHwQQP9EDc1KObWU8wqZiGL0+yGTxt1Ej1EJFmtDlTc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(38070700021)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <06A0182CC866FF4D97CFB8E3E28B8322@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 H6Dnl77y276hvRsIa/qFcCiNFTWqEXgrNqiC07845Sv5OXMI12Xse7qU6JJoYi0BQiirFbFOPpEUmdyNfVaMNVcjj3mVcTOMuSrY1TvW5rWqWzYe6k0XXo2uEc+Yda5OX6oQj96mGAVMxce2LXPBBDr5y2f6MzxUm2AUwxEGay/GZz0/n5CFg/db+zXW3U2pFsBJKuKZkSTpmhooNiP3VsLF07c6xPCiySh6Ks9WnMph0Uub8OAjIPXvL2J3A9QCVtlzmrjCvw2fIxN1ZFsprwF77eyHgEZn43sAbtg+6S8NKUXeHDv9LcdPeLQFg96njbA7G8P/B6QOb0YhqeeHjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ad5398515bad4a4286aac19d21c28b68:solidrun,office365_emails,sent,inline:8f71565d48f6236daa85971a5c500720
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adWK6r4jUhBDcYg5ZbnZm8FsygamI1n5no/kRwvOw0C82up9iO5+bYjtolPp9CEsG0csn327K+ictbNpm8xliT370pU7LvK9JaDKRINBGkrMYOvooBM2VHgtRVWgkMfjXCwOWOteUNJkzY5B6x2xYExv8TBlPhKQThjYZaaiJ6Iu+zuk/LdyNTbgc2euzZ61NqMUeMNYspVcu8nmXooDnhjjF9VUG7hJ/1bsBxjztYlgLEs6OArrsie3PO70vnxfUu4IjG5CVrR9AdaJIuNq2yIDqqo0jtRQN9eve6E6qTFsnxKG98SBLlsCToAVI9UlegeOkjPpyQROO8Al+Yutpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITIvDaHUlSK/f8ROP6pkQ77HHwhAcpXbyoj/O3Cht9M=;
 b=G5JrYznGA6ihzz9t+QV+U+gp9aQmwbIMIScrBagERZlsxKJBu9Qg69XKuSjD8RyXMvTkNr1IxrfGk/MB2uEXRRDD0eXGCEI9X8XMCaw17WRvH63jRy7XUn6hw6By7IVGDy04jxRjs+6uW++bvBxW2FeAxHzS9VUwUbE7ETEwzQmD7t0NhPHrtq0emmtts7AXRNbe8CF+JHRplOo4cWpRJRRmQ5GyGsbSI8a+p9KhzRNlY4SElBvgNjSNHoX7Zaba/EfBWMaodVy3k5AcKbSZL4xde6xpDdORrS+gEc4UxYIyEhc34Cn1eI7pl5rNEBRGc+r5zC1VYkmoDYaXjALZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	edad9bf9-7826-4de9-1d2c-08def6ae2367
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|35042699022|82310400026|23010399003|14060799003|376014|10067099003|56012099006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2uICjEEmyNOHQgvw9VDhJJDWWlORtYeYoj30RRFfM/xdA1NOQuBCRWwAMcX+V2KB1WywkebMVCjERK7iVEZyC49tpMQJGpwm4dEM9r0EgzVGusi3I9MkZMTsMZhjJrQYL4JBqgm3SWXxpIla8X3Esz/T+0IdbMBXvsGExJpUeMMggRrbKIxecwO86Hw8OKMjgC7u+MJcQl+rQ5eqNrtej/9CGyXNuO8RTnPv1n9OXQBZdx2kdFRAhJOgQiWz/tl3cXNO5ITd5C3k7dABrtHj+uFz8boI1yixuZrRfFn8PyRsWqOm8NBTv6XSDjo23kAXTBuvCiAW+CkpE2+GxXKVdHFlvMApPfDvYxSuuhdxZM8UcFUEE4V8eoUEXA5ew9r5gYG0U2Pf5y1LdAMtqt56lhAMk9wdl7xXW9s8xPcOyYuTNp0WpMsM+3qSOc/pxxPW1zpfA2dDpCpE4bqNWyVjHYv2mcKvzLmSaEAyuGVvgvmsTdsREs2Ox3QQSc2bmstuAP5BUdKhIvVFLPbm+uoqiGNdn9rfxZah/ymAb8k0abgEVXZomcj04V5U/i90QooJI40FNpOzpVeS99cn1/Pn/EJbeY00kCVlTPmQDTSNEFflLmDMXQot6+g5w23klN15oP7zX3cNNsjc5KX0aUe29FkmlgX85LY7oy+Xp7swd0JBleZhB9LJ829+N+V4BLQ0KllhXIi9ZxTOm3kwxVIvfA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(35042699022)(82310400026)(23010399003)(14060799003)(376014)(10067099003)(56012099006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6dfkz627/ARf9qk9AptF7JGNgr5KYItQcs+ZOszw0FKwyTNfXRi5DHG5v5LyXoOX+rjDqeD4zeU7c2trFnvmrY8b4vEHwTEWXXvU2Vehb9JIWwa+kdsjnkF3Jr2nqAfxWCrNazlH9PBpxVhZ3I7EfJH91vV9ZevCgtxpIXn/fJK3r1oJl3ZHotpcb+3FjZ1lkID6wXs068ub5pFDInDqFu7fe4Sbx9bYXP/ln2qz7pPTujuqhIqKEq5Ic5asoQ+tnyhVtPg6Q5eyI4f9javxqTKc2Mi/m4VAwxHu0X8V/Z5DBFDEE2rOhnWTSvJCkRyYH/XrCtHIjikaHxSO4gC9G0akEJY3kTa3eUhBpRCOUDJvbQdy5Y6iTQ9UDeYVqCOdjxnFB53wZFeDeB1yJgkX2rzzPE/FnvOVauzan9jZX4N+g+N29FQwnKXroPHl8+of
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:08:21.7891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf26b7f-cbdc-4052-56ad-08def6ae29c5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

T24gMDkvMDgvMjAyNiAxMjoyNywgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToNCj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMyBw
b3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6DQo+IC0gW0hpZ2hdIFNEMF9EQVRBNCB0aHJv
dWdoIFNEMF9EQVRBNyBhcmUgaW5jb3JyZWN0bHkgaW5jbHVkZWQgaW4gdGhlIHNkMF9jdHJsX2Rh
dDAzIHBpbmN0cmwgbm9kZSwgZGVmZWF0aW5nIHRoZSBpbnRlbmRlZCBvdmVydm9sdGFnZSBwcm90
ZWN0aW9uIGZvciB0aGUgMS44ViBlTU1DLg0KPiAtIFtNZWRpdW1dIFRoZSB1c2IwX3ZidXNfcGlu
cyBjb25maWd1cmF0aW9uIGlzIGRlZmluZWQgYnV0IG5ldmVyIHJlZmVyZW5jZWQsIGxlYXZpbmcg
dGhlIFVTQjAgVkJVUyBlbmFibGUgcGluIHVuY29uZmlndXJlZC4NCj4gLSBbTWVkaXVtXSBUaGUg
Zml4ZWQgcmVndWxhdG9yIHZfMV8yIGlzIG5hbWVkIGZvciAxLjJWIGJ1dCBjb25maWd1cmVkIGZv
ciAxLjhWLCBjcmVhdGluZyBhIG1pc21hdGNoIGZvciB0aGUgQ3lwcmVzcyBIWDMgVVNCIGh1Yi4N
Cj4gLS0NCj4NCj4gLS0tIFBhdGNoIFs1XTogW1BBVENIIHY1IDUvNV0gYXJtNjQ6IGR0czogcmVu
ZXNhczogYWRkIHN1cHBvcnQgZm9yIHNvbGlkcnVuIHJ6ZzJsYyBzb20gYW5kIGhiLWlpb3QgZXZi
IC0tLQ0KPiBjb21taXQgOTljMWQ2YzZjOTAzODhhOTNjYWE2NWUwMWY1YzY5MGU2YTZkNDVhMg0K
PiBBdXRob3I6IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPg0KPiBhcm02NDog
ZHRzOiByZW5lc2FzOiBhZGQgc3VwcG9ydCBmb3Igc29saWRydW4gcnpnMmxjIHNvbSBhbmQgaGIt
aWlvdCBldmINCj4NCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBTb2xpZFJ1biBSWi9HMkxDIFNvTSBb
MV0gb24gSHVtbWluZ2JvYXJkIElJb1QgWzJdLg0KPiBUaGUgUlovRzJMQyBTb00gd2FzIGRlc2ln
bmVkIHRvIGJlIHBpbiBjb21wYXRpYmxlIHRvIEcyTCBTb00sIHdpdGgNCj4gc2xpZ2h0bHkgcmVk
dWNlZCBmZWF0dXJlIHNldC4NCj4NCj4gWzFdIGh0dHBzOi8vd3d3LnNvbGlkLXJ1bi5jb20vZW1i
ZWRkZWQtaW5kdXN0cmlhbC1pb3QvcmVuZXNhcy1yei1mYW1pbHkvcnotZzJsYy1zb20vDQo+IFsy
XSBodHRwczovL3d3dy5zb2xpZC1ydW4uY29tL2VtYmVkZGVkLWluZHVzdHJpYWwtaW90L3JlbmVz
YXMtcnotZmFtaWx5L2h1bW1pbmdib2FyZC1yei1zZXJpZXMtc2Jjcy9odW1taW5nYm9hcmQtcnot
ZzJsLWlvdC1zYmMvDQo+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA3ZzA0NGMyLWh1bW1pbmdib2FyZC1paW90LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOWEwN2cwNDRjMi1odW1taW5nYm9hcmQtaWlvdC5kdHMNCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAwLi45Y2MyMWFlMzJlZDRkDQo+PiAt
LS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQ0YzItaHVtbWluZ2JvYXJkLWlpb3QuZHRzDQo+PiBAQCAtMCwwICsxLDIwIEBADQo+IFsgLi4u
IF0NCj4+ICsjaW5jbHVkZSAicjlhMDdnMDQ0YzIuZHRzaSINCj4+ICsjaW5jbHVkZSAicnpnMmxj
LXNyLXNvbS5kdHNpIg0KPj4gKyNpbmNsdWRlICJyemcybC1odW1taW5nYm9hcmQtaWlvdC1jb21t
b24uZHRzaSINCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IElzIHRoZSB2XzFfMiByZWd1bGF0b3Ig
Y29uZmlndXJlZCBpbmNvcnJlY3RseSBpbiByemcybC1odW1taW5nYm9hcmQtaWlvdC1jb21tb24u
ZHRzaT8NCj4NCj4gVGhlIGNvbW1vbiBmaWxlIGRlZmluZXMgYSByZWd1bGF0b3IgbmFtZWQgIjF2
MiIgd2l0aCAxLjhWIGxpbWl0czoNCj4NCj4gICAgICB2XzFfMjogcmVndWxhdG9yLTEtMiB7DQo+
ICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsNCj4gICAgICAgICAgcmVn
dWxhdG9yLW5hbWUgPSAiMXYyIjsNCj4gICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSA8MTgwMDAwMD47DQo+ICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAw
MDA+Ow0KPiAgICAgIH07DQo+DQo+IFRoaXMgcmVndWxhdG9yIGlzIGNvbnN1bWVkIGJ5IHRoZSBD
eXByZXNzIEhYMyBVU0IgaHViIHdoaWNoIHJlcXVpcmVzIDEuMlYNCj4gb24gaXRzIHZkZC1zdXBw
bHkuIFRoaXMgY3JlYXRlcyBhIG1pc21hdGNoIHRoYXQgZWl0aGVyIG1pc3JlcHJlc2VudHMgdGhl
IGJvYXJkDQo+IHdpcmluZyBvciBwcm92aWRlcyBhbiBpbmNvcnJlY3QgY29uc3RyYWludCB0byB0
aGUgcmVndWxhdG9yIGZyYW1ld29yay4NCk5vIGZ1bmN0aW9uYWwgaW1wYWN0IGp1c3QgY29zbWV0
aWMgKGZvciBub3cpLg0KV2lsbCBmaXggaW4gdjYuDQo+IFtTZXZlcml0eTogSGlnaF0NCj4gRG9l
cyB0aGlzIG5vZGUgcmVwZWF0IHRoZSBzYW1lIGNvbmZpZ3VyYXRpb24gY29uZmxpY3Q/DQo+DQo+
IFNEMF9EQVRBNCB0aHJvdWdoIFNEMF9EQVRBNyBhcmUgYWxzbyBpbmNvcnJlY3RseSBpbmNsdWRl
ZCBpbiB0aGUgc2QwX2N0cmxfZGF0MDMNCj4gcGluY3RybCBncm91cCBoZXJlLCB3aGljaCBjb25m
aWd1cmVzIHRoZW0gYmVmb3JlIHRoZSBpbnRlbmRlZCBzZDBfZGF0NDcgbm9kZS4NClRvIGJlIGZp
eGVkIGluIHY2Lg0KPiBbIC4uLiBdDQo+PiArCXVzYjBfdmJ1c19waW5zOiB1c2IwLXZidXMgew0K
Pj4gKwkJcGlubXV4ID0gPFJaRzJMX1BPUlRfUElOTVVYKDQsIDAsIDEpPjsgLyogVVNCMF9WQlVT
RU4gKi8NCj4+ICsJfTsNCj4+ICt9Ow0KPiBbIC4uLiBdDQo+DQo+PiArJnVzYjJfcGh5MCB7DQo+
PiArCXZidXMtc3VwcGx5ID0gPCZ1c2IwX3ZidXNfb3RnPjsNCj4+ICsJc3RhdHVzID0gIm9rYXki
Ow0KPj4gK307DQo+IFtTZXZlcml0eTogTWVkaXVtXQ0KPiBJcyB1c2IwX3ZidXNfcGlucyB1bnVz
ZWQgZGVhZCBjb2RlPw0KRm9yIEh1bW1pbmdCb2FyZC1JSW9UIGFsbCB1c2IgcG93ZXIgaXMgY29u
dHJvbGxlZCBieSBHUElPcywNCm5vbmUgb2Ygd2hpY2ggaGF2ZSBTb0MtbmF0aXZlIHVzYi12YnVz
IGZ1bmN0aW9uLg0KDQpPdGhlciBib2FyZHMgbm90IHlldCBzdWJtaXR0ZWQgdXNlIHVzYjBfdmJ1
c19waW5zLg0KSSBjYW4gZHJvcCBpdCBpbiB0aGlzIHZlcnNpb24gYW5kIHJlLWFkZCB3aXRoIG90
aGVyIGJvYXJkcy4NCg0KPg0KPiBUaGUgVVNCIFBIWSBub2RlIHJlbGllcyBvbiBWQlVTIGJ1dCBm
YWlscyB0byBhcHBseSB0aGUgY29ycmVzcG9uZGluZyBwaW4NCj4gbXVsdGlwbGV4aW5nIHZpYSBw
aW5jdHJsLTAgPSA8JnVzYjBfdmJ1c19waW5zPi4gVGhpcyBsZWF2ZXMgdGhlIFZCVVMgZW5hYmxl
DQo+IHBpbiB1bmNvbmZpZ3VyZWQgYW5kIHByZXZlbnRzIHRoZSBTb0MgZnJvbSBwb3dlcmluZyBj
b25uZWN0ZWQgVVNCIGRldmljZXMuDQo+DQoNCg==
