Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52679480DFD
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709563; cv=fail; b=TRkbhPibjYtwF6z1SE7IgEycoI/q+ODpFJdZKLrDvBjSmqmYl5G3m4cMtmZxGyY92PpE+hh9EyvUOBiLvh7gS55UBbaoxFBBK0z/fCWB4Xpco4kLDI8Rw9VhJwbnlUkMHyQ2bxUEUrpSZ/+t0iDzQpYBmfUHwUqRPn3p9qwjAdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709563; c=relaxed/simple;
	bh=WpXhpH94AG4BXhh7BsSGa9ECqQ7DlC2mibaT6YhIutw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p3ns+3BSI185bondKnaeJKtv3NWWYJ7GRDsFeDAj8s2lhUYaooocnKg7leMiskmWIUVA1KrTqcnC8jUM7ewWkV8xp/pTrgEgMKAkS6Ljsvh5jRW7qT1yivYNp6y0Fx2tzwGDukuNPef1tIXGJ+rtrJNow0iQO/EHA0LY1OgCQhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DDDmjEyL reason="signature verification failed"; arc=fail smtp.client-ip=40.107.130.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DDDmjEyL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrXfyf1vkPkBKxFfRnW6iW3F9Cp1/LrTSMSwKQ41LytdVOx66U3SZrhmt/oIgtY4zMM3RjoMzqksFIIq9pcHabWmd1oubmSLbQLNUTmI5ijCUG3fvoqPB67ZKxEHsCzEO2py9xYEK3Awq/6o72c/K7XzwWThWrQUmhzXXVvaLzT3+KdHupo56bMWlqCiHZJ1kfTWN4arULov7YWWGluWREopwZuIZsUBo8yZ6/e80nruMBgCADW6HHjhqyTbv92ZMk9o0QsNqGIlGX4YwWQ/i1iXVLtRIw4bpw8qF0FlOYRMYjSBQJ5Vi2GXxAn8G49pd9lbv9IQtKPe7V8kozmI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEXwVv+bvj/1nG+XKUwAwBcEzfg7hiVowsLUmbhxFo4=;
 b=BQw6CPW1+D/T90ZMIptMl1pqBHPvhKsAwEMyuQm2r1e9oUHfkLycaRwSSekguSPaAYXX40N1FvRUzcYtCNiLmdMkT8ydtlh36TAt8clbk4kQMkJWme5wyr/Ax9e7MaskcbfsH2oQZkHf9heFGKjgOihMLXhICs2y0Ivs8ufF2gRvCm0C9XieXHpN4uZrPo3rhcbF9v2lzv4VkJvtWL8A2djXfu9LeGUvff4KfXeESg/E3N1p+7KVkVJQTmkbqN9+nDiBZIyNQdgkds4Vd1YfiU/v7+xMwuLWy0ADWy27XLMzsezuW0m8M25pTGE8WGpTPO8xv5+doACztcGJ9LGMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEXwVv+bvj/1nG+XKUwAwBcEzfg7hiVowsLUmbhxFo4=;
 b=DDDmjEyLMWMRcTQGAfZl7hfxIN5P0f7ufgAmnPbarAkaD1pxlo2Ov6t0dFiIRwGBnNtWLrxUInUvQQnyvvYK7mJfm19mVPyb69/PFsmoMNEmpwqrAa2qmjI6BhWUnvLt8Nxs2uOGTpFRC9R6wlPMjeebHQR38HStKJ9FTvbxjLiXdrheQgSqWmAZnG6+kcnXNGAe3QlesGxt6ohWz0Ou/wKoPIIzBU3zNbU2j9XdE+JCSIVrCgREuMSXggvgN54ex7pIwdSlGWTZOh3tl+ZVbi6s6nCo7Cq6Iyy8MLzIwxSl4Ny+tARkheVXCyQChQTiV2lHS7iDdrMF+IPqK4YqjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7775.eurprd04.prod.outlook.com (2603:10a6:102:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 15:19:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 15:19:15 +0000
Date: Wed, 17 Jun 2026 11:19:07 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, linux-i3c@lists.infradead.org
Subject: Re: [PATCH v12 5/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <ajK66xi-P6xG5EfY@lizhi-Precision-Tower-5810>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-6-lakshay.piplani@nxp.com>
 <20260617111804.ABFF71F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617111804.ABFF71F00A3D@smtp.kernel.org>
X-ClientProxiedBy: PH7P220CA0133.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd1d238-2e2c-4461-48fa-08decc83cafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|19092799006|11063799006|5023799004|4143699003|3023799007|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+1+Ndmg5mVdorcpSUd9cTpbnxKHAtkVXZXMP/RAS+e16A5uHPYkwSEanouaKmYexGi2k+FErzRv/mo5Z7NGbOzbsIm/8KLBIqc6b6XPrIWdnncAjtf1o6/QYR6yMsA5qfeS3hnQThZv/gIFVbBEBttBxayz1vMFNkeuAzEwL+24Vlw7EHeeGmJsB3p8BrVv9tdL8wvb5SnzxNe63t9QwYlg891raP1kIGV5FNiO799eGhxaierAkwUNRyQSj974WyJZvrp0Hk5yO3pekaj6Nei1T29evxRHb9eJadTdNATqU6OaxRxad9BjXdGq0qv6PtJ8TO1df/xPckxEYY2DQoym8QlkvvIFW2BjQZkUWvLyn34WF9IlPrRQ4NPztMqsXRz/Wqwx0GbwC+dTojh+GuHT71f08vqDIK6KVuvhh/lVou2Reg4OClx26Owsfayt9bdQqc5YU17FFoDd/esvMLnimKPvQ+IHpX6dR/spi0ruYPsNwwOUPtmNFjseFCppXl1iVBCXX7y9V17DvTKTHCj3ErwVwjcoptPHaJUFS/pVlVT3SZ4IybGAjQMKrsx+XWs3Tl8jNbIyaKu5FqJpXRuwb1JeE+Npmhd18HAnFKeRF5qA0s4ILx91uQjA7YGB2BnSjEiP2VDBU8fK8EzSs3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(19092799006)(11063799006)(5023799004)(4143699003)(3023799007)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?FfMzbAeMl6vnETKXShGfFCmEgxPeh/pRyjJNWJ7CtBIXZ/sFboJe9OcT8C?=
 =?iso-8859-1?Q?Fjp3A10hJRaQuErFYo6XmB/VZ4daTAJfLHLIq6WuZWFg2rraxGZalGlYuO?=
 =?iso-8859-1?Q?kjBoRQZlFKf9L6qgAS2kXifgDjEMGpUZ/9KmcdWJCXqQdH/MPKl7L/8p/m?=
 =?iso-8859-1?Q?vMqxrdbpoxIDZHzPz2PeKm0tjGN28QSyntLP/cZHHuUVTI2SK/bSXAFAgW?=
 =?iso-8859-1?Q?Ub8lWfcr0WgPy0LuvfyTgnZ+f/VxrHKEOq/W1BQYrUYxa4KmFMx0WHdQa2?=
 =?iso-8859-1?Q?SNharFUVN5NUU+4hXXGuiErzvK9jPTouT3enoyUyKx3bR0phZPb7hEdziZ?=
 =?iso-8859-1?Q?Vs1hoBaXnaK76PNT8KIrjEjbV3Po4nK5Rh/wsFcZKbdbWqG+XTpuDbgjf3?=
 =?iso-8859-1?Q?BWMp0zt2z2OSSiHhkRfohMKgROFUEUARel0yKV1Nor+9Jek98aet3ElmeN?=
 =?iso-8859-1?Q?po/UXbOY8AabzW06sP44B6hTjgFc71EKs7084ixUHdIKAE7laiwc2/f4+i?=
 =?iso-8859-1?Q?2xt68mmDK0DOB64fXw2mfz4a1N7d1sqgNlHU6wRaiZ73Nybc+uWigUFGp8?=
 =?iso-8859-1?Q?DSotgUbv9rf5IdifOezFY8sgnIOlsV+1xefL71tnwq4L25CYfVa5ZzMEm0?=
 =?iso-8859-1?Q?o0BYP5kJkAZvV9ezWrfjnZgijvUepbAewGmfz9yZvU6UjEDTANyPrxY+Jp?=
 =?iso-8859-1?Q?Wr9mJ6zCR4h6K9hCyycfhz12hP/kIw4mIYvgfBfAouhHNUEsF2BOI/Kan1?=
 =?iso-8859-1?Q?XJqviwXRsG7iXvTxMQG4ZXCGR8TGBOn5WWXYilGz2ozxGUnM8s1s5W2mro?=
 =?iso-8859-1?Q?o68T+EHxq775W/wGMsG2qQJtpriHCLaB+JGJz3M/+ZqorUNSR9fFbUBik5?=
 =?iso-8859-1?Q?BWN9lSnJVgP0HNGDtEuG8KxYPitRmoNRCZ7IyZ5EEf7F5lkol+F9c7Pg1S?=
 =?iso-8859-1?Q?EdsSPD+sR9eutKv15dH78or0a3baORy2rLdhjK+JtTcxB412KUN8H2uRb6?=
 =?iso-8859-1?Q?V6P437c8YEkyaP+QHLRv8+pY/PDcEBVmQqmzjybPxrR28754JMI/pqxj7w?=
 =?iso-8859-1?Q?/UHxjurEWgXe+eTRbHMRGDfZaD5NJ9NKRHHZtufl7aAj4eJP+h/BI49d+R?=
 =?iso-8859-1?Q?T7MT7Ft71Se2e/DMBuzD69wIlDB+UMv/vnzc2yuFjMsKvJAQx+kHGQhneh?=
 =?iso-8859-1?Q?fppt1awlhXK6yHDrMKazwV1dsg/H9S1pS0FzMLBXCZznnnCpsHgV1wNv7L?=
 =?iso-8859-1?Q?ohA82UYn0GXSylcsk6e3FZGOoJrKT+v1CaH5SJqh40Hq4AxhSWDC87e2vZ?=
 =?iso-8859-1?Q?4eOB9xgvvxDNtBkh4hn/PJjSIKedXuoooRDFOQiw3ofMG8F4LoceuPCB4t?=
 =?iso-8859-1?Q?mtUQb4wHHCvX1DbecxcaCTijcAu9y+lXjtyXMj/kWf1Mnm4YMflOX5OrpX?=
 =?iso-8859-1?Q?4ZZlCSKrMeCX5y/TKpPF53ynzcQeFesNDI4+GHDCzqpBWbLsEtRnu33D5C?=
 =?iso-8859-1?Q?zDsDY7qNHQWHIvs9HLw4yVvmEPXkUnLPNf1BjbVgL/gmlX+lbSiQe2JZNy?=
 =?iso-8859-1?Q?ZHD2qU5NrYAIi/t6vQZuEZBW3ZIZsZ3dTy4tTQaWtBI2LV+o+Nzyoy43V8?=
 =?iso-8859-1?Q?cPvvwJS+Kf+79Hvgfra/80BV3Eda12fwzkIkJ8BiNTgN2WxfMb6vmm1cnJ?=
 =?iso-8859-1?Q?FXwj0lbrHVnjChD2B5uqMcHTY59GkgaHcI6LjhMTUn5QWLcKVtgg3eeEZH?=
 =?iso-8859-1?Q?DdHgjJ4DNOx65+wOYCN425DzGNvcf932+iOzU5VOOX4oPRsELuPEFY8i0z?=
 =?iso-8859-1?Q?wojMVJymWareIrkjuXx+epGgmca0jGF4aZCOJDh0H8vuGUDhiPqx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd1d238-2e2c-4461-48fa-08decc83cafa
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 15:19:15.3391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYVaKHg5tyALlk6G1HQDF3lY1oDVei4EpaEruP4IoQJZvlHvVXX1Z3TY8nvC8Oh8T8apXMisAL6x1GpmYbnhMqf9SiPfA6e6ss6I++YH6g0RCkP2HNqh73JxCckYYLR+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7775

On Wed, Jun 17, 2026 at 11:18:04AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> - [Critical] Deterministic NULL pointer dereference in `i3c_hub_free_ibi()` due to recursive callback chain.
> - [Critical] Memory leak and double-free memory corruption in `i3c_hub_request_ibi()` error paths.
> - [Critical] Critical race condition and parent bus state corruption in `i3c_hub_master_priv_xfers()` due to unlocked address mutation.
> - [Critical] Unimplemented `i3c_hub_recycle_ibi_slot()` permanently leaks hardware IBI slots.
> - [Critical] Architectural bypass in `i3c_hub_do_daa()` attaches dynamically discovered devices to the parent bus instead of the virtual hub bus.
> - [High] Calling `i3c_hub_enable_port()` outside of any locks allows concurrent operations to physically enable multiple downstream ports simultaneously, breaking electrical isolation.
> - [High] Silently dropping broadcast RSTDAA commands prevents resetting of downstream devices.
> - [Medium] Accepting I2C devices while unconditionally rejecting all I2C transfers violates the API contract.
> --
>
> commit 2a201a9e0e9a55b31467d874340085240b34afc3
> Author: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> i3c: hub: Add support for the I3C interface in the I3C hub
>
> This patch adds virtual I3C bus support for the hub and provides an
> interface to enable or disable downstream ports.
>
> > diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> > new file mode 100644
> > index 0000000000000..e8744b5172340
> > --- /dev/null
> > +++ b/drivers/i3c/hub.c
> > @@ -0,0 +1,483 @@
>
> [ ... ]
>
> > +static int i3c_hub_do_daa(struct i3c_hub *hub,
> > +			  struct i3c_master_controller *controller)
> > +{
> > +	struct i3c_master_controller *parent;
> > +	int ret;
> > +
> > +	if (!hub || !hub->hub_dev)
> > +		return -ENODEV;
> > +
> > +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	i3c_hub_enable_port(controller);
> > +	ret = i3c_master_do_daa(parent);
>
> [Severity: Critical]
> Since `i3c_master_do_daa()` executes the DAA sequence natively on the parent
> controller, will the newly discovered devices be allocated and attached
> directly to the parent bus instead of this virtual hub's bus?
>
> If they are attached to the parent bus, won't subsequent transfers completely
> bypass `i3c_hub_master_priv_xfers()`, causing communication with these
> dynamically enumerated devices to fail?

I forget some background, does all devices under hub port shared the same
I3C address space? that's means dynmatic address is difference for all
difference ports?

I2C switcher can support the same address at difference port. look like
diffenent port devices should attach to hub's bus. Only temparily attach
to parent during transfer?

Frank

>
> [Severity: High]
> Is there a risk of breaking electrical isolation here? `i3c_hub_enable_port()`
> is called before acquiring any parent bus locks.
>
> If multiple threads operate on different virtual controllers concurrently,
> could they physically enable multiple downstream ports at the same time
> before the bus lock is acquired?
>
> > +	i3c_hub_disable_port(controller);
> > +
> > +	return ret;
> > +}
>
> [ ... ]
>
> > +static int i3c_hub_send_ccc_cmd(struct i3c_hub *hub,
> > +				struct i3c_master_controller *controller,
> > +				struct i3c_ccc_cmd *cmd)
> > +{
> > +	struct i3c_master_controller *parent;
> > +	int ret;
> > +
> > +	if (!hub || !hub->hub_dev)
> > +		return -ENODEV;
> > +
> > +	parent = i3c_dev_get_master(hub->hub_dev->desc);
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	i3c_hub_enable_port(controller);
> > +	ret = i3c_master_send_ccc_cmd(parent, cmd);
>
> [Severity: High]
> Similar to `i3c_hub_do_daa()`, does calling `i3c_hub_enable_port()` without a
> lock risk enabling multiple ports concurrently if multiple CCC commands are
> issued on different ports?
>
> > +	i3c_hub_disable_port(controller);
> > +
> > +	return ret;
> > +}
>
> [ ... ]
>
> > +static int i3c_hub_master_priv_xfers(struct i3c_dev_desc *dev,
> > +				     struct i3c_xfer *xfers,
> > +				     int nxfers,
> > +				     enum i3c_xfer_mode mode)
> > +{
>
> [ ... ]
>
> > +	if (hub_addr != target_addr) {
> > +		down_write(&parent->bus.lock);
> > +		hub_dev->info.dyn_addr = target_addr;
> > +
> > +		ret = i3c_master_reattach_i3c_dev_locked(hub_dev, hub_addr);
> > +		up_write(&parent->bus.lock);
> > +		if (ret) {
> > +			hub_dev->info.dyn_addr = hub_addr;
> > +			goto disable;
> > +		}
> > +	}
> > +
> > +	ret = i3c_device_do_xfers(hub->hub_dev, xfers, nxfers, mode);
>
> [Severity: Critical]
> Does dropping `parent->bus.lock` before calling `i3c_device_do_xfers()` expose
> a race condition?
>
> If multiple downstream ports initiate transfers concurrently, could they
> overwrite the shared `hub_dev->info.dyn_addr` before the transfer completes,
> causing packets to be routed to the wrong physical device?
>
> > +
> > +	if (hub_addr != target_addr) {
> > +		down_write(&parent->bus.lock);
> > +		hub_dev->info.dyn_addr = hub_addr;
> > +
> > +		xfer_ret = i3c_master_reattach_i3c_dev_locked(hub_dev,
> > +							      target_addr);
>
> [Severity: Critical]
> Could passing `target_addr` as the old address corrupt the parent bus state?
>
> `i3c_master_reattach_i3c_dev_locked()` frees the old address slot in the bus
> slot map. Will this erroneously mark `target_addr` as `I3C_ADDR_SLOT_FREE`
> on the parent bus?
>
> > +
> > +		up_write(&parent->bus.lock);
> > +		if (!ret)
> > +			ret = xfer_ret;
> > +	}
> > +disable:
> > +	i3c_hub_disable_port(controller);
> > +	return ret;
> > +}
> > +
> > +static int i3c_hub_attach_i2c_dev(struct i2c_dev_desc *dev)
> > +{
> > +	return 0;
> > +}
>
> [ ... ]
>
> > +static int i3c_hub_i2c_xfers(struct i2c_dev_desc *dev,
> > +			     struct i2c_msg *xfers, int nxfers)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
>
> [Severity: Medium]
> Is it intentional to return `0` from `i3c_hub_attach_i2c_dev()` while rejecting
> all I2C transfers with `-EOPNOTSUPP`?
>
> Would it be safer to return an error from the attach callback to cleanly
> prevent I2C driver binding if the hub does not support I2C forwarding?
>
> [ ... ]
>
> > +static int i3c_hub_master_send_ccc_cmd(struct i3c_master_controller *controller,
> > +				       struct i3c_ccc_cmd *cmd)
> > +{
> > +	struct i3c_hub_controller *hub_controller;
> > +	struct i3c_hub *hub;
> > +
> > +	hub_controller = dev_get_drvdata(&controller->dev);
> > +	if (!hub_controller || !hub_controller->hub)
> > +		return -ENODEV;
> > +
> > +	hub = hub_controller->hub;
> > +
> > +	if (!hub->hub_dev)
> > +		return -ENODEV;
> > +
> > +	if (cmd->id == I3C_CCC_RSTDAA(true))
> > +		return 0;
>
> [Severity: High]
> Does silently dropping the broadcast RSTDAA command prevent downstream devices
> from being correctly reset by the hub?
>
> If the command is dropped instead of being forwarded to the downstream ports,
> will devices retain their old dynamic addresses and fail to re-initialize
> during hot-plug recovery?
>
> > +
> > +	return i3c_hub_send_ccc_cmd(hub, controller, cmd);
> > +}
>
> [ ... ]
>
> > +static int i3c_hub_request_ibi(struct i3c_dev_desc *desc,
> > +			       const struct i3c_ibi_setup *req)
> > +{
>
> [ ... ]
>
> > +	ret = i3c_master_direct_attach_i3c_dev_locked(parent, desc);
> > +	if (ret) {
> > +		i3c_hub_update_desc_parent(&desc->common, orig_parent);
> > +		up_write(&parent->bus.lock);
> > +		return ret;
> > +	}
> > +
> > +	kfree(desc->ibi);
>
> [Severity: Critical]
> Does freeing `desc->ibi` here leak `desc->ibi->wq`?
>
> When the core function `i3c_dev_request_ibi_locked()` allocates `ibi`, it also
> allocates `ibi->wq`.
>
> Also, if the inner call to `i3c_dev_request_ibi_locked()` fails, this function
> returns an error to the original core caller. Will the outer caller's error
> path execute `kfree(ibi)` on its local variable, resulting in a double-free
> since it was already freed here?
>
> > +	desc->ibi = NULL;
> > +	ret = i3c_dev_request_ibi_locked(desc, req);
> > +	if (ret)
> > +		i3c_master_direct_detach_i3c_dev_locked(desc);
> > +
> > +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> > +
> > +	up_write(&parent->bus.lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void i3c_hub_free_ibi(struct i3c_dev_desc *desc)
> > +{
>
> [ ... ]
>
> > +	i3c_hub_enable_port(controller);
> > +
> > +	down_write(&parent->bus.lock);
> > +	orig_parent = i3c_hub_update_desc_parent(&desc->common, parent);
> > +	i3c_master_direct_detach_i3c_dev_locked(desc);
> > +	i3c_dev_free_ibi_locked(desc);
>
> [Severity: Critical]
> Can this recursive call to `i3c_dev_free_ibi_locked(desc)` cause a null
> pointer dereference?
>
> When the core initially calls `i3c_dev_free_ibi_locked(desc)`, it invokes
> this hub callback. The inner call here successfully frees `desc->ibi` and sets
> it to null.
>
> When control returns to the outer core function, it unconditionally evaluates:
>
>     if (dev->ibi->wq) {
>
> Will this immediately dereference the null pointer?
>
> > +	i3c_hub_update_desc_parent(&desc->common, orig_parent);
> > +	up_write(&parent->bus.lock);
> > +
> > +	i3c_hub_disable_port(controller);
> > +}
>
> [ ... ]
>
> > +static void i3c_hub_recycle_ibi_slot(struct i3c_dev_desc *desc,
> > +				     struct i3c_ibi_slot *slot)
> > +{
> > +}
>
> [Severity: Critical]
> Does leaving this function empty permanently leak hardware IBI slots?
>
> When the core finishes processing an IBI, it returns the slot to the virtual
> controller. Because this doesn't forward the recycle request to the parent
> hardware controller, will the parent controller eventually exhaust its hardware
> slots and permanently stop processing IBIs?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260617110355.1591844-1-lakshay.piplani@nxp.com?part=5
