Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E353033EC
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465769; cv=fail; b=geunSlYAtNY48L/nH93jSvsjGLCT6rPGatAMv2DytbKgs6e5/wTiiW9k9QlIJAggIZI2hDklsjCrl9Bj92ulvZdVUYA1c1iSxc2oAgzNhalF5HuFAR6rnVWXcptl1EDkPLkaVW1jvGERN0zUsqFjL7/Xi9j0QPkHTbNyogEwW/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465769; c=relaxed/simple;
	bh=YZNjM5eFaoNSwvCoG5gaUa7PMjQ160BCgRjvG56BvBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QmOGQv9MTQs57dSheQ2VqHKnvD3/zfFiAfQcTMfh+rNliBvgGaU05BbFXXHvAc/zvaCTSoovwMh4E/BMPqNpuebh7wj5Ex6LTJE10j8CXhz8nGfhmSdJP+UkfTmJwlIdWWgstxCSTPYVdS9DaOWa+YTcgwoue28nLwsYgFnLzOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k84zZzGP; arc=fail smtp.client-ip=40.107.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k84zZzGP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEw4VcZJNyFXP+Wp7nuDZZQoVR30r9iPlaGdnPJf0E7V5QYGZgj5/Hlpbc0RCUiBeP6+UpAOyQuM7DGBOHWC9SL7VZA5rRlhULjKtcU49oHbHOMdw8Gk+7l0eQiv9kxhP/1xytqfT8Q2O1avVaBfm+B298JlIMD7qhBH0zrCTkC+365iCtsf5CJVrimZ6PjVJlQ0j6PAJ68QPlDEe1MLORrnKcKyaVLA2nvmlehB+FWr8Kvwo1OyAQIMLGcwuhhQ5fZXN1EqKbT7bl3PV/pXFMx2jTEF6BeicHRQ/geRNRC/dY1VyPF3a7zVg0VPSAf7uaU/AaVv+SzY0jOobQgOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJWFbOPlA70e6+dnkUwuhcuvxSOZo6ZYtFpHWdbij3Y=;
 b=djm2P1iRK5CY3C8ikjJlQriJ2gZ+2YZxb4S7pKaicfgkcFhuqUflSIDu9xM4mlYLAYEUl7of69OpA9Ezy8ESjM6eY5WxQfp2YtJ6V9z6CKaca9hUpWCq/uG38JRySQbxw9X4CR64OCbMPwhKLQTq1zQzkpra6RXk2xkFHogIRzkbPUeYFhaCegbeBtuyUjyMwR9eBVlfIBYOJ58LqnVabI4ENPwzZkh7sUmZ2+QOAEjeSt5GfQucJ/ghrEc/8NMyNOuLe0W460NWcK4f3bHkg80mKhF6l17AApPJ+es/mPN7mpGitF9VzRDvdnkqU19GK7fYgWdjlNPbo4l6hwvYsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJWFbOPlA70e6+dnkUwuhcuvxSOZo6ZYtFpHWdbij3Y=;
 b=k84zZzGPCEholFaSKAauUFZ+fgGb7Wd09D6FMO7zrN4i31CvNqtlygZNzsm+Lbgtga4DDLmtQ9HYchSxIqmNNfzgpc5NrnYK4CHA/mHMW6PVPx9TqTAmgh+6wGHX+TkRZZun9wWmz8kZ7kGM7ZaJM2FncTC6PunJ6OuewkrdzXNm114+v/mgCuUvA0W3myVaNsWTU/68Rrzd0gvXgV9JLi6fu71700K3GVLyX6K92US4b1aJeSqxfvS77R7dqx64Gwa7VrREAG1UxZ84KvGxHWkQNzE9jvYrLpMyisA+FvtFkc9ZyNg/eHjHcJN07tCURjZ9TXOaSjPb5bh2p0Jiuw==
Received: from BN9P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::15)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 16:29:19 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::a8) by BN9P220CA0010.outlook.office365.com
 (2603:10b6:408:13e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 16:29:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Tue, 11 Aug 2026 16:29:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 09:28:52 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Aug
 2026 09:28:52 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 11 Aug 2026 09:28:50 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <frank.li@oss.nxp.com>
CC: <Frank.Li@kernel.org>, <akhilrajeev@nvidia.com>,
	<alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH 1/5] i3c: master: Release the fwnode of i2c boardinfo
Date: Tue, 11 Aug 2026 16:28:49 +0000
Message-ID: <20260811162849.1242167-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <anOJ2V4_R0KFM_aQ@lizhi-Precision-Tower-5810>
References: <anOJ2V4_R0KFM_aQ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: d3662819-d53b-4b3b-656d-08def7c5b189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|30052699003|82310400026|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dYivr4SLYioNWytnW37IxHQPeUY+WMHqLvVzcmztMSzIOiFfPu1fDJVJto+GwAtpdfzGagWwZ9O/p3qr8mrxv4aD/8i5sFOZ0zX5SPkI9BnbcviNU4X5XBRSxZpKRgyKXhD97aAahYS2a2kB6W67YjHPR/WrbHgM1vuTBgSvzQ8SB7G69ZZARYF/yYIhPw57p+9jfwASGuxJVDdftxmKM3e/pJic0QlOsROniVModhwb2wIuj59Rt59HuC0atz34VtNWraMS6++on0MsgyEN6qxzTcLEK61+/jF2dFXu5iu8yjsEKLeHmCAxIm5KthaZQF40Oj1bXPW377HcDp+Q3TXQ8TL3I0xctwbYuztacJPHDQenkrgpucbmrvxLDvXrsMLel9SVBa8QtA15+ahrmo5uiumd59Q8dkwfSYBF7LQrrbpFeCmmL/ZSdRXwoi615iYjZCB6x7q+3hNwl74/oDgZzriSvU5893JrRRpLoO66kOf/fTzAtta6Vpo2RVtzeZgK6gk4ERO1W+/Gd/q+Zqiw+hjESPqhISG7QRFoyXJZgObxWJm8N1XmEWVZRCj41Bxk21q88NNU4rS1nELK3I4XctwaYaSp3dAHVrsdBGFb3tab2sYxx8XhB8PpLutK+GM3Z6Arr4+Qqcdrv2qyWDL4NlThxhAnS0ToenLEcwRfFNPKOrO0y3Fefinj9CS7OShj4pc0fnif4M3n823dKw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(30052699003)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	to/cMYIIW+wEfwsZGrtY/h3AZay8V+RTiE/4ZyeXUzNOC7jZ3wm64w7Q1zYUF1OZ1/Z2l3hjyAZkZcMrJXSaVAxXtLmkCyCvwHsJRZIgusrMSO4VboazxOZGMs8hleBv1wcouvD7iBy7/bAO2Dj4b4Jg1zDWIAlrlAQzxqTEQMLnFOX+HHfRzKutNHRWUNrxl4+zpryS94YF+5//pL3XQ1XQrfgOQ92yYFyYytKoRb/LFQlxal5HoMJofYdTwgi0HqJ0JhBxMKpz8nzcQYCb050limGwCHHjymeLL9hK34Sk0z3vKQUAx5rRKmIhdHWZneXTqIET1+QtITT/UN7Ux28sj3BpRS/MnAbvJCht0v/fuVwlPEqTjH964lUk3HU5apBKFqlehLCbOZggwDnacj1/p3LLyiUHoTzw1H4bDTrKK5edAKF2Et04M80/xsxh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 16:29:19.0446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3662819-d53b-4b3b-656d-08def7c5b189
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190

On Wed, 5 Aug 2026 15:07:05 -0400, Frank Li wrote:
> On Tue, Aug 04, 2026 at 10:33:05AM +0000, sashiko-bot@kernel.org wrote:

...

>> [Severity: High]
>> This is a pre-existing issue, but while fixing the leak for I2C devices, it
>> looks like the identical leak was left behind in the I3C counterpart,
>> i3c_master_add_i3c_boardinfo().
>>
>> However, would applying the same devm_add_action_or_reset() fix there
>> trigger a double-put use-after-free for instantiated I3C devices?
>>
>> Looking at how the I3C devices are created, i3c_master_register_new_i3c_devs()
>> assigns the boardinfo fwnode to the new device without taking an additional
>> reference:
>>
>> drivers/i3c/master.c:i3c_master_register_new_i3c_devs() {
>>     ...
>>     device_set_node(&desc->dev->dev, desc->boardinfo->fwnode);
>>     ...
>> }
>>
>> And when the device is unregistered, i3c_device_release() unconditionally
>> drops it:
>>
>> drivers/i3c/master.c:i3c_device_release() {
>>     ...
>>     fwnode_handle_put(dev->fwnode);
>>     ...
>> }
>>
>> If a devm action is added to i3c_master_add_i3c_boardinfo() to drop the
>> reference on teardown, wouldn't we also need to add a fwnode_handle_get()
>> in i3c_master_register_new_i3c_devs() to ensure i3c_device_release()
>> doesn't consume the reference the devm action expects to drop?
> 
> Make sense, please make i2c/i3c handle fwnode consisent.

Patch 2 of this series ("i3c: master: Fix refcount of i3c fwnode") does
that. It adds the same devm action for the i3c boardinfo and takes a
reference in i3c_master_register_new_i3c_devs(), so the put in
i3c_device_release() is balanced and there is no double put.

Best Regards,
Akhil
