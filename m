Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34373803E1;
	Wed,  2 Sep 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364876; cv=fail; b=FaFRRY8GEpT65rCRWo06NKuBEMG+UrmCv1KZNjO+Be2hTYna0fE4E/qVKN1q38AR94yp2qbxtPDotXo5ycrobWrLvS9zxdRIUhpnhPakZwFNPH+Cs/se60Mn1fPu9JdtEytrk2OPWSqVspli+W58UtY4dfOv+47gKATPl8R/lq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364876; c=relaxed/simple;
	bh=HLryX01GsHP6/xZXHAS/KW1jEO8jNohmHIJ3N5oanfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nKI4hE13AXPbAE6Mwl/5TK7wftNcdNcyd+Ly7R1rlF2LQUknEzma9GAUzNMwUi5FVEhxWZSxNm65rv8d4wxaG3WikSxe72C71WGqJ2lBMaZ6Ocn7tS3e0sVLJcol0jJumdiK9IdNYa6AMZoe3FSZE93kOVq1YazwW7pzzm6KhW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ahB5LJ2A reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ahB5LJ2A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1/7Grxu9ERdft7ScqJTC7XlQlbYnSxiFX7AbkUR4zUIP7ccTsRqTs+X3J8waaWoTWgukCgH5w+r7jcXmnepGf6p1+S3aURkv7YrjCjJoVilqy7YukLaGnej2uxQINZ3WWMDMAFHN4WGad7fie4RD6nhUe5dutIoqVP/CHR8qsGg6leX9d5UvgE1k2ah9skoeJMKQef5i8wUYNVAelTwaFhMGOCMjDEuNvjn9yV5X35Vm22nFAUOWyWkpLVmxcawzJRQ1ZR4x6dF4ed0v/P4XllZLiOINrewofkaVq8lAXWuuqu0Vw+3j6Ox+nmk+i4WweiQpCIjaUQntSY/Fp//BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZD84wHU9yf9EUd4el17YLd1jRJQ5KbqCgRhoI02hgZU=;
 b=X30N+qvgNeB0CZ5X0/bQrZrgQJ5E8rrr6O/AKHGkjz+HhDmA8l7hZWqjjezZy6IQHwMAhnM2CZVjubqsyxgYj3Dh5vtRyXoB/lLjRHvMGZrknDbPnAZsbA+CXIx8/K/gUuP5uCxFtB0jXZ8H70OR7S2gGXtUTXH2K+ch1/PWQKMVmTKtIM7nR0h1oyINP5DTU6uXFu9LxA0j6/ety7jNNBsVNVxnaNp4BUr4Z1FQOPsR8ACkbYyLDZm0Upvq3+4RsVoEEHNGnkp3nn4yle8FZZ9MmUBCTkeMsmqJ+X+QVJtwUMvtv99XeA92n16CLQNGynBVVFvlFFjcYCqn4dLETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZD84wHU9yf9EUd4el17YLd1jRJQ5KbqCgRhoI02hgZU=;
 b=ahB5LJ2AX/hnITox8VGL/TVCN4up8prnHDQiclnqCsAdDEvSSFLzWQGIIbQGbUHa7tMX+JRAygSzjnz7aOh1qqHybPpmfr3QOqCVqkrVX8J/rgHCNkssjETPDDfAxZFoHfYDux0eofoS2e8hCSUpDT5UKnsVLKjMackO/foParDVtkxpAb/3a0k3bhsHeOZKbMH4XAQY330recRPmPZdPpytbmFfVsWfnI08Qh05aR4LJNvUWQlHkSlzGJwPJvNZDvWcFbE8675WmMueaoHdIWohNp51FLktO5PECAzkUjsF23OxwPoIhHnCkbLbfewq2kdOc85DOF5SNpzCXBLh8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8552.eurprd04.prod.outlook.com (2603:10a6:10:2d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:01:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:01:10 +0000
Date: Wed, 2 Sep 2026 11:01:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>
Subject: Re: [PATCH v45 5/7] firmware: imx: adds miscdev
Message-ID: <aphIPLYOftOvk2t8@SMW015318>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
 <20260902-imx-se-if-v45-5-6e400879d8ec@nxp.com>
 <20260902112233.C49181F000E9@smtp.kernel.org>
 <GV2PR04MB122713015DD30F535100C7A3B95B72@GV2PR04MB12271.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR04MB122713015DD30F535100C7A3B95B72@GV2PR04MB12271.eurprd04.prod.outlook.com>
X-ClientProxiedBy: PH8P221CA0059.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 2662b861-0f2a-4194-72c6-08df090b67a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	y9lnoQed9p1DJ2cooxp0J2rcViMql8DhHuPJxrQPwj92CKFjfzG0sk4O9/LlANYNX6X3bqM6nTdNUWcKcY9B8TlX3GokpdZbrCfPSDl7wzhJBQ6/kMRRevpDYUj0CcQ3PgMK3NRRTfT77Ff/O59zieUjt05T68YDpD+0Ka1t+rXWdR2EUcoSrNtJo3SYTI0FqHTq0RSX7r0Pvu3BkCxGtvBqe/hWdA4AnuA2TGjj8cp9PoRbPsMiKYa18kEIBO9hn5kJmjkWfNjASy4dDzzzm44LNj2EeRhI9uZhbk3cyB6XxaOpkgNTnvcBCvx6QySI9u9xfO1QJqQZ3TRzjJJEnGp4BH1VsKILxYL7oxqDPBFN9Q4wtdoA/cyu6FGtQ7eq+rLxvQ/RH9j4EtN5zQPyoe/eprNKj2wC29tBxW5V2XfFrHHUVdEEZ5P19gki1mt9wC4nBY2VnpzW0haoEkuwcTNO2rk9Mo7+wArcd66O31fSing2Q0VTDWsXuWjMppmK+McHq9id2S2qUJg/e2IK+TLNfbovixvoh38w/1+3FZJzF4m9jjBgncss/oaNjgtE2fbfK1aiuOX0DS0if/oaQO64brvWRky7uZ9/kKDenLM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?v3OD1Zc9RKkgQVlIMRro3HdadxcQtVwEvkZaHOdqN3BesjV1QSNBTFxUvT?=
 =?iso-8859-1?Q?XljNXOfXqT52QHn/QRn+tuSDe+iOgRS5VTM5AjmhyErMmVKsvLxqepKQX5?=
 =?iso-8859-1?Q?dz0/cjhn7pts0csgFy+zsvAurFTJbbc1dP13iTx3aGXOeftXtnQE50w2bd?=
 =?iso-8859-1?Q?Ukljob+eze+3HELeeVZWkVzAtXAlhNLqzEbKj/oCTNFjXvRDF5aLDALRMn?=
 =?iso-8859-1?Q?4HGlf0eNtmABOhh40gz/zoQH0wEJqvFA3y6+waR+RKlK3bEbv+KklG9zwb?=
 =?iso-8859-1?Q?m8O3/lZ8UN3RWmtP/I9KX5CiKY3Azqi0G7B5JqHstY5Hrnx8hL81TxxtjL?=
 =?iso-8859-1?Q?GsMV92JtmJyxa5gwVpeTefu9y5jRFFrMyWwSOnKYA9S04QB8wvabRSGot5?=
 =?iso-8859-1?Q?u6uQg9H6xESi2tuij4DYu5KhUmkVXbts8EtsACejrYZNgq2Q1w7MW+0i2r?=
 =?iso-8859-1?Q?Ed1lvk/ZccHpbFknxoduZKEZksVAcdm19jFizd+9z6jgxPB3nH1AA2dutN?=
 =?iso-8859-1?Q?wp0WyNESohUj4IZ4K/2roUczUcRXybjESN9Th+z+6z7F3rr/a1Tb7tXMEA?=
 =?iso-8859-1?Q?Wk/dH6rmsKj9vETvmlGNqyUPP2XIHdeP99SPQn7aQNsnwzTKZ2VyVy4oAM?=
 =?iso-8859-1?Q?u6IwgKu1yBl5mnQ3Q5QcfsmfLCrpLgthbYCXywwJlJwSlbwfTkwGu8KJxT?=
 =?iso-8859-1?Q?0iE/DvCdenMez1ss0F5S+ItbUR8Zjny42A19cjsURTsmLFeGowcrsAKzaU?=
 =?iso-8859-1?Q?yxuNtXEMykhqk05uNjjHFlxsGTQRRnUakILylrTFsUYa5GDNpCtRaRDWLx?=
 =?iso-8859-1?Q?iSrc1RHF/HB7Y7oVPsOA06HrqNeJYOlm32U3NgPoes4Jx1LBYghJ192knW?=
 =?iso-8859-1?Q?bVrPAODIsmFCt74M/3mMxJpnJmkW2lsCx6GNqYiqK5jsv4iHvfR9xmHuLq?=
 =?iso-8859-1?Q?qQ8BxPeX1KGBbh45usl6RD2HOsMM9NnGfEi0AB5CpQPezNWmQynwa1WZAK?=
 =?iso-8859-1?Q?8450M+FRpjmOnvFATSiLoQc0lTJAHYYlW4APrR7fdSK5xh74FPB6ftMt0c?=
 =?iso-8859-1?Q?inVc8De1cmtEZM/P1ZfrSGxtJlvuzDx9oeXQcdWUrjkGpmIkigq4YAT4ps?=
 =?iso-8859-1?Q?8U3Fel+DgOkLD3BsCCUPXltbi0W0cBnLE7OJk8/HJj4NwGwXUHLTgb9GRz?=
 =?iso-8859-1?Q?O9QBW0VByOwKi6FyZ3CS8BEDVL0aprb72UkRBP+WhAX4UnpH86Vq8M0lPa?=
 =?iso-8859-1?Q?4DSefh+Mtkb9r3CN2ophiuoZ0LpBJ+8Sceo58k4LPc2x9rIH/U6hFjnmx4?=
 =?iso-8859-1?Q?uIJOXGKxS4T94vPnQcmbCLSjgKOT1x6TaFwDnoISP2j943bZEDE/LSLN8s?=
 =?iso-8859-1?Q?U2ycpR0KhHFZAl9d/paOV2Q8/Eu66I/pRLKz3mtIyOhuHmr6ufAa0IsMJq?=
 =?iso-8859-1?Q?8A/sn9gZMY3vrwv6dYvbSuAyETvv9loPd4wCPSFTVlfkLjIe1xLuw4G/ju?=
 =?iso-8859-1?Q?FwG5uWZbLelSW2kQbQs8TJ2LG+HXZGdIidUywB87w4OYh4ycucipSM+DJG?=
 =?iso-8859-1?Q?o1tymY7/icblHVLBqf6oUkH3fH08rm5dO6sf3CU7KlDffk3EZLFh0zpZQR?=
 =?iso-8859-1?Q?oKpo8o1RP007jo3razhsOesFcHAgssCHuZg1PRYe2XuGgtIEhAt5HgjPxv?=
 =?iso-8859-1?Q?iEKRhLjGzzTUWabQBNMc+pJhjvHvakxUvpecAaHzCw/9MpEeqgp5GIz6YD?=
 =?iso-8859-1?Q?+oUbE0K58OrcyaqGWOivV4vzT4/HL7HvLrd/tTo4/XER2APQpg21ZyT2ky?=
 =?iso-8859-1?Q?Rdy3/AGhCJQdCd/FjEPsZ1WaOTpLEwCfYu6PiMgOkvvYHkkheMTp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2662b861-0f2a-4194-72c6-08df090b67a9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:01:10.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcoU/iSyLCO3u9r38RWKBEQOJRPiwC+lWJqQTmjYXARs5Wq7JCuzEZueAL47GUKhQ57WEJsef7rAUzyVc5M+3chFtzWRjOiij+hiVfAD4LY8vA8JMpQjIi9s5Ccxyaqt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8552

On Wed, Sep 02, 2026 at 01:15:08PM +0000, Pankaj Gupta (OSS) wrote:
> > --
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260902-imx-se-if-v45-0-
> > 6e400879d8ec@nxp.com?part=5
>
> NXP Confidential

Don't mark "Confidential", this is public mail list, everyone can see it.

Frank
