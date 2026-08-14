Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6C047D945;
	Fri, 14 Aug 2026 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786724568; cv=fail; b=d0NdiBQMlf06HbqQSzulgxC3SvU6M3AW65Da90jZKbKW8MFZ1hmXL5Kin8Z/1ncHUyy4HiVw0Vw9bKy6X4xHBugTMkg4Hq8zFN86eiQH/ENQbK1W4KLsmiESjsM9wsvymqa5o0YIRiGg9VoQXN1W1mWTULGB0/c3nvicGYzr27M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786724568; c=relaxed/simple;
	bh=7IfABD7mnTQPBeCyBVAkveKYlmFb1X4AY8KIsACwMIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EZlo8WmVgobgw0yFAH7WeMTXQDwtpNXFqhS0TxWEEwbhpFjmrLnieiVR1niVkiDyJa0lLb0O7sSNP5O3TLuUBmohqqnJ7mCkkqmBAP0mcDEFKMqjaFqv38hDTw7CqR20YR/8AVSE6CwAYlitEdsxnqoiN4vCEGTxb66iCLsJKhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uOOKXwJR reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uOOKXwJR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe55ub7RVA1EwjT6+WH1Gcp9bc7DN9i0/Vi4W12KG6NxFq2AjGG6HZeWs1w9Yq3f05MAAG8JPqkHYX3n5j/lPLGp4L/cCzAwovIwwTRihvD5O2FnnD/JptbnE7viNY30zrNJ2lGghl6qqIHacPK/s94JYaJxuxrciKBMPZiuBgKpl/4nwTsZm+wpl/fgM8t9KjKGBeu6HatC++SxnD7bZ9fCxSWQYQaW8YMJrQlkEaIjZvqFsbeRmwahNg/+7Jxa7zdBIsTlSRLa5qCW9M4rvSL53E10cPwQGnOzSksz+mPJg84tAWNdqZBQm+79QwpnekWhRZ4GdiZn+uBVMlgDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEZ/LT0o4KZhgNJGct9JG9BdpWx+LRGaSxc9463CpBI=;
 b=lqbpPMMHXs/dcKBpsOZ9nIJ041DoZ524/u7mdULm4CGod6MNQyUBGZR6m9ftfFcU6xvMO3f2byyBSecYSfEF9I8mEdL9Z/D4O6UCyVv9+LyZ42U1E4r5YeYTVRnLMW2B16NyrJCRJ1a5F0Q3OAEJnUh27Po0bYAzt/OGLo6vGLN8YOkmEwDa1GFQA181M+lTf17XWkkqoNQNG1xVrFi7CKxo22wSlUS1qY00AiofAjehQ0PxU2m+QgF5u3Ufoz+ww2QSmprZ/lbgcDBalDTqJRwKfDQir1LI7OmbQ1VJqx7HSALYghYB39IITnrkFMBLl635zjBh5BLYtzvtMLYt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEZ/LT0o4KZhgNJGct9JG9BdpWx+LRGaSxc9463CpBI=;
 b=uOOKXwJRLd+ChjrUjVsVmfIq0tgEGNIhzbVkDX44vRx2we+2F+NBPl5eMOHUgN+0eR1xg/K093Zgj3zi2Sihs+FeRH1z0UfsJU02D7S7nv+v4Rqf6dgBb/LWXJmqnqRbWI7bWdz00XMSG1i4OKxIp1PEobXkTbosJA3gF6gK9C0yNXxJHxTGHNlAI9yK5Keu8/wwOsKYbWX8aGcvBThCxOY7EzXEaBvP7XNUluTXvW+DlC+ZxsbqyvbNy2FFD0sCkOxYU25G/+jgSl3LMB8cEeTsfQ6CRROkpJNtiF0+o2+XxVU/QUPMkFa20HeNfFskC630wWOV8Sy24WaLGobFhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by VI0PR04MB10299.eurprd04.prod.outlook.com (2603:10a6:800:238::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 16:22:41 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 16:22:41 +0000
Date: Fri, 14 Aug 2026 11:22:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Chancel Liu <chancel.liu@oss.nxp.com>, conor+dt@kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, robh@kernel.org
Subject: Re: [PATCH 07/17] arm64: dts: imx93-14x14-evk: Add pinmux and mark
 conflicting devices for MQS1
Message-ID: <an9AyQbX8PCl0Cbq@SMW015318>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-8-chancel.liu@oss.nxp.com>
 <20260814073317.E8A691F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814073317.E8A691F00A3E@smtp.kernel.org>
X-ClientProxiedBy: PH0PR07CA0044.namprd07.prod.outlook.com
 (2603:10b6:510:e::19) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|VI0PR04MB10299:EE_
X-MS-Office365-Filtering-Correlation-Id: ec120329-b057-4cf9-e3bb-08defa204335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|56012099006|10067099003|22082099003|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Sx5mPPhe/pZKGIVTBKPyf6SCa/FAS65aLww9SzToXZ+5efvfAgaf2lHc/X5StqBhKrJvRTazYdbhVvRszmOkTE5m/D5vDw6/+F87FHZTLAeI/Lg47az7syJPnrVW979roxcmttPvE7mLOd0bU1rlbq8AK+txe0vdGaU+pFu3E2zuQeZNoW4zjPKvczy3CW+7GesdX4fd7j3TqWxor//aX7VTEej0dfB1DUvchDW3Jm6Rg6u9iGEt7de+NLBdeyVZc5ERrnkhwpp/eBtBixwzALF+n7ERCcEfkQvKhkTdEfz4hVXh43xkd9+64AJcTqJMKW0TiTvfhMreyzlrNuXhC4R8t9/QRWQuCTE83629mId+CTskP8aaallN9NPY+b2Eid79aP4a5WOHoY3Mg2t87L+p+sJ2AMPgQ0/srf23ZFejb+V2RBic5GCzP5UP7FzH4bdtrEVYEMPGe0h+Qng/Ago7BYTjd09YFZG/J/YIBiMi00K5vm7asLy+6/sem0enJVz7oxvWI8IXtyd7uI7BOBlI2AqCw7Y/g5ju2uef7HTizdf5q3edRws7ThhthfCIBNaxIEs5jT9uBZDpEuYePQjhB5a2gVKH4fPdRCZztCM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(56012099006)(10067099003)(22082099003)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?/34dGO78hCY3evZVUhECfKjeuoVHVYzZLhORgC9M19DW4ML5l9JoCWjPKM?=
 =?iso-8859-1?Q?R935ovz3em4N8wGPuA/TjCuSxD7hQEG1Ot3ZyvHlBE35IR+GC6IshJM1jF?=
 =?iso-8859-1?Q?XJYMEDLFou+5D2niMW7t3AnjbRNkreNsFeErDWYicd88qc3UdJ7IUaLi2M?=
 =?iso-8859-1?Q?vYBEVLuY/A4dosDqAzb3tswL09wx3Vy7omlNwo5m3KnsKCm8WBEx+enaMm?=
 =?iso-8859-1?Q?GjnY1gvOwuRJ3/0htEbb6r6/nSBsr4fZ2mDRRVVZPjeEl1/5zGP074QHaQ?=
 =?iso-8859-1?Q?kJwOgGZyzgpKr25ol+lzZkqDb/f03XTSfU7A/Nql3u4IwzuQ1u1B6+hF0g?=
 =?iso-8859-1?Q?HeROSN1jtUIsKOrvApjEX3b8YM0F99FztNbhHOK89wk7855k7Iih8LRstL?=
 =?iso-8859-1?Q?uoTb8MtM5L9tMWTTmBYJGaqNT7Fb6v6oSPK9r9IZGeskKKTJFNwBTBpSdm?=
 =?iso-8859-1?Q?YB8dcOHzrXOav6C+WN5F4WliuuLUr5Okn8z8HPlYDYGm8MwI/4B2bhnFh/?=
 =?iso-8859-1?Q?F81LjR8pA+VlS4n7uNvX91ola1Q9djXpB5SyuFZmyzdhwEXwRZ0umOoICd?=
 =?iso-8859-1?Q?TXhMWVEgtvIbUO4lktXv9S0/7xpmSgFPii8gLbvpz1UeqghIp3GdVvxBKb?=
 =?iso-8859-1?Q?42xhvuiLZicZsbYVH0WK+sxJNExCf8muQI4g1o3nGLVCpcTrcQaTk1n9I9?=
 =?iso-8859-1?Q?lcxzgxXdp98gxOnSad+2e/hen9vurPI8Y1aepOTDEGuAsLelJAMeU/t9QA?=
 =?iso-8859-1?Q?c1dlVvysdIcxLAFqlgsU4mWZoPa8B37rL8Z0Qk/I+9wyctLcDKUZV7S+CW?=
 =?iso-8859-1?Q?sNp8jS/lh3bTs7vJMy7kmXkbxhSiWuknH8sfeaWF8HhXnj5QpE6OTQwyPN?=
 =?iso-8859-1?Q?cqWIEsQ1ykKQanfdGwIYraDB3egfZtDs+tzIDwHZj2Y4UVcG4iwe7i37rZ?=
 =?iso-8859-1?Q?i31mi9oXvmBz6vCMylrrFhF3jg5wzRJLsAaDFxH2vnD8Ex/+YJNr/7bo2n?=
 =?iso-8859-1?Q?UBcpZW6RAAcp0l6Cw+ALfLgq/faVP/9VaX8OD9l7ayq3cCgtXjBFq2fUMa?=
 =?iso-8859-1?Q?7rm2BPEB41bYpiC484GzdahxcgwXiwslG4+u18lXF4b6VxOC3P6Wh42krY?=
 =?iso-8859-1?Q?FQ+o+p1gke+c/tdYHzgJjmaHhY3AIGN4XHR5oRw7NJGDTYhmXgrO9Jiajb?=
 =?iso-8859-1?Q?HplASlYtyGNs3L7cLB5BsO3jSzvfYYJ0lNFV/j558kEXQCFCLXPpLMQmPH?=
 =?iso-8859-1?Q?kcRYQ6Eu1CUs2U543e0YIDaQy/ESoA+g+g/m9Te8KrY6C3Zf0N9tQmu6xY?=
 =?iso-8859-1?Q?vFm+clSvBUr76XyJfeUXvHN0vX6TPfZXocrYTF92AH5yGDxg+b8xMuk2tX?=
 =?iso-8859-1?Q?rXN6hmLF1vg3I2nhXs94UsZymH17xrTQ1pcdLhSqrxkk+kvf8dHivuXygi?=
 =?iso-8859-1?Q?e4d2WLFzaat1/kyEnwixwPCqx5RT5ryoDlJgp6AflXtwVgC2FTpxLDSTIp?=
 =?iso-8859-1?Q?foIo+s+JZz5JoU4BYtztHXhv8F7AdMuyFk8c9Y3z+gMnruSBQ+J/KYqQ6N?=
 =?iso-8859-1?Q?t6MvwHNtqjYkz1t1RdBn6XrchHUiC+pl727qALrK+IYJvJ68UJLB2TIglo?=
 =?iso-8859-1?Q?/c1KnMIRnQ9YbsQkQlC0uXwCd89wbxz+GDsmaVJXyZjd51rQvacUah8kq+?=
 =?iso-8859-1?Q?7+thaV7BxOlUy3ir8q9GTVtEJaHps8i+ViI7Jb9OOJFA/hfap/LvqilUZQ?=
 =?iso-8859-1?Q?k6EiFDhnveq6IN8wQXUs0W2/8kYi6/kSvIfoklvScnEA3Qqvt/sHSY9UCj?=
 =?iso-8859-1?Q?RTm9qeX/fgPlm18/ToM2fKhC2I+I+d7W7y4W8FFZYHgbiHEvaCsL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec120329-b057-4cf9-e3bb-08defa204335
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 16:22:40.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geNLxd+fR3ud6s0WWQKjLJ3BgmjI8KBqhUUqH939d1Cg7mJTwO/OfNjyrNgS0ZWi/4vIsKGcdXjGMxj0Is7sRSM7InMoS4cU8i2lsyk8MxFiuJVfmaz5mD/3MMS7bMur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10299

On Fri, Aug 14, 2026 at 07:33:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `&flexcan1` node is missing the `<&can1_fun>` pinctrl state to claim the board multiplexer, potentially leaving the physical pins disconnected from the CAN transceiver.
> --
>
> --- Patch [7]: [PATCH 07/17] arm64: dts: imx93-14x14-evk: Add pinmux and mark conflicting devices for MQS1 ---
> commit dcb616d828fd4526406432c88e7ade3c33414225
> Author: Chancel Liu <chancel.liu@nxp.com>
>
> arm64: dts: imx93-14x14-evk: Add pinmux and mark conflicting devices for MQS1
>
> This commit adds the MQS1 pinctrl group and labels conflicting devices
> (BT SCO card and FlexCAN1) so they can be disabled by a shared overlay.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> > index 502237fab3324..11bb7e52fbb1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
>
> [ ... ]
>
> > @@ -282,7 +282,7 @@ ethphy2: ethernet-phy@2 {
> >  	};
> >  };
> >
> > -&flexcan1 {
> > +mqs1_conflict_dev: &flexcan1 {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_flexcan1>;
>
> [Severity: Medium]
> Is the &can1_fun pinctrl state missing from the pinctrl-0 list here?
>
> If the MQS1 overlay is applied (setting the mux to state 1) and later
> reverted, or if the hardware boots with the multiplexer GPIO high,
> flexcan1 will become active but will fail to assert mux state 0.
>
> Without the &can1_fun reference to claim the board multiplexer, the
> physical pins may remain disconnected from the CAN transceiver, causing it
> to silently fail to communicate on the bus.

Make sense.

Frank

>
> >  	xceiver-supply = <&reg_can1_stby>;
> >  	status = "okay";
> >  };
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260814072022.4064009-1-chancel.liu@oss.nxp.com?part=7
