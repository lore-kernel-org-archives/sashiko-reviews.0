Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5092138F658;
	Thu, 17 Sep 2026 18:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671275; cv=fail; b=jamDFHxxPs8LflngEVObjpdKXtgFcPiL8bRGluCPp0zAgsBqXKlbEDFu2Z4Z8gusp51CnbXiv4E4XEWz8i86j60uaK7Q5IsdwdFZ1i53L6kX14RsFYAT+NWD0XDPobXzBhE+wDIvt+oWj0KaoeZFXVpySbxuwJYoh4RbXl1PORc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671275; c=relaxed/simple;
	bh=TfJau89+QZmMf1Li2y4Di+t0HEZnbyYZXCDvKV2rtX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QthrhxEwtKBVa+1Ba1P6YbmQt1twyr0gCmyoKkVAG36eIKsmFgbuhkZYA+PQfhnG9DFwBJIex9Mri1/Da4wSX8CysTGkjo0bkqdqz0lOuefiH4eci/eO8CMPLh6ZRJG3aQeXolntgUyw3O5MsCxBInNmT5CqTj0XA9qGz/7DAN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AlcDaVis; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AlcDaVis"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxBbXWU1Z8La22qvCXzALdh1JyECZ0hw070XkTjtbqfyswl/oSc5UeYIYufwOtRx384O08wYEOnhkHjoUll/BvpcHEwGY9crAijusDpGBg6uRGxxLSyqQ3Wk/PFp/9wGp3QafuSZUhB1lZ+jWMn45GL8aPDbz6PHSUkTR+5u89HZtxVv4zG+mkda3+hFk5RYvofLORm8XaUj22P8V4Odus3/YJ5V3OW2AXpZXCkf915lo+ApTW7XglsSH4AlN7jlUMW1Pt/X+/9v4UH9IGtXVNl+KYjWy5Ez91EVl9W9wEFY9gMma4YDojAGI8VTAJ1rfDuxygzPQRxbdsik+15o0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfJau89+QZmMf1Li2y4Di+t0HEZnbyYZXCDvKV2rtX0=;
 b=mvJBcV5EVvq9Rwyv0ujhTpEyB3VcMrOAVz/wnsXAfT60ipXVZ+o+GLQm2kC/jN6gdC/GiBoDtsWej+nY1VkUu72R8N4vDnI2d9OdA6RLlT76j7bkIcd/QAm8lONXmoTmnvSeniDbCyd5q26b4ZbZEAxkv7BVHZ4Hd0S77T0e/6m+MMJg/7e2BZuuLxTeT1MJ3KtDr38YHjhYnJtxnbUnZY2Qfid55e/9tOInQwgHhPpt+jf3wwiPTukV3onJXBsySMzQgVw78tI/rRg0EBu+Tw3Sk+GtAUDolNGgCICkRsgTDzBgOeEVZMUtfAtjcSYPguxiXOdZhAlaeyhk2uH6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfJau89+QZmMf1Li2y4Di+t0HEZnbyYZXCDvKV2rtX0=;
 b=AlcDaVis75HnHY8oZRptjmLKD9ieZsZHXq3ji7Ivfh4u8ugZhQXK87eHUuPDHVwl6Qp9I1qeLAZCWz+OfazG1D5f9f87gL3Knfme2gzE1mPRdH/WC0sxaUb8oo2zvsYuV71bmn4vimmiuOyyLmvTu6dRGOzBq4gRfyGcZGpP0LtApHeUFPwJNkOvrC2ekAP4zD2OnjpggE40Gzu/XhXl9QMoIWvBln80D0nTSdyDwPgg//ckOJzWi1gd8vqkYmA8gl8ZlFm+osrHHIu0rp1sWisrB16vaCazcUVo4APxgKNEa9Gkw3Z7M20NUD88N96WC/sTffUgoygO/F1XCYd5rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9235.eurprd04.prod.outlook.com (2603:10a6:10:371::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 18:54:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 18:54:31 +0000
Date: Thu, 17 Sep 2026 13:54:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, frank.li@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000
 node
Message-ID: <aqw3X9aQzm7LWPVi@SMW015318>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-2-3689fbd8b516@nxp.com>
 <20260720212401.C2BD31F000E9@smtp.kernel.org>
 <CAL_JsqJkL57yUCF41BJvsoJkhhRb8xnukdtxe61fXB1r_7gK_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJkL57yUCF41BJvsoJkhhRb8xnukdtxe61fXB1r_7gK_Q@mail.gmail.com>
X-ClientProxiedBy: CY5PR15CA0165.namprd15.prod.outlook.com
 (2603:10b6:930:81::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cb5b18-973d-4f63-4424-08df14ed1b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XYOD+p8l85zrX2dbLqGLhcC2FUYaWgNn4czm6z6VbIFf0AGpx0z67dn64++QOlwKA/xQeOkUZgqu1v75/kor4hpMdNlmmvHEdM5om8dQZk6J1SMK8rFKfyOgYmxdxQr+3ihkEW40XWOfAXZgVd+dJOcw+SGEy4sWw3sH1Kjcb3w3TkNNf89+dJSHi0VZxoQbZpl0NKyaN/TAc6JH08Su26ooxRY5jVXq8I3noPEBgEo20zBkF/g9Z4dAEltHr9irPAmxFDLxROMf5YYu2cXd+PjHxM0nfepzQ72OW+ng0zf7g7Q7JRXjFjFLhi+plxpDUzL3UFwCeTZGpv+x3tCfr5rmxKvESOQz4wwCrlSrH/TjHOjCn2Rix8GytnAicnFtJUBesvuV5a2JO2TGBYewX6PsaxO1seBYd5N0JX9Qpp5P8vRXve4iSOXOH/xdr/FuZ8aDjtKZ4K5LSc5fWJtXmnMHydu1r+69iy/bPy6ov1DMyW2rpadM3T2iCeHqtxV2LRIGj9nhvZ8TER7KgLQL+ApC44zPkD+OkxD2DTWA1pyeP/NLxk6A7KENQJc+egKxhxp14UVYoW1tCqQ0pJPzNxTy9i2SNWF6hbcIKtRf+2n78pkf6gjxhClpQW5/BU5M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkJ3OHkydGJiQ3ZYZks2UlJ3WjVlM2xYdHMvOFJIcjM5Ujl2MU5XdVRYaFp6?=
 =?utf-8?B?aEF6VTA3VjRyRU1OTVQyV3FEMnNBYWFHRTJNR25LcUEzMXA2NGFKVFdKdi9X?=
 =?utf-8?B?WHM3amo4K2hLcjRLMkdQZlZyUWRDRjlXMnE0VzJ3MHVLRHVYZmFTVU5Tamg3?=
 =?utf-8?B?K3BXdmdqazVtVmZWZS9iZm9tUUlCRzN2eU94Q0RpQUdXOE1zbTdCM29HRXlo?=
 =?utf-8?B?ZFIxSGNnYXZGTnFlMERsQ1JObzlyU0ZwbUhDSnd4b084Z1R6UjJ5OHJ4dGRO?=
 =?utf-8?B?V3hzd0p2dllzSXRQeWp2T2t4c0dOaXJhSDFDVEh5azFqa0Q3TmpQclhkWW9x?=
 =?utf-8?B?M3FXSnpPMmRWdFNFb2FUUjdEUjJOSUtHYzdiQmRPa3ZJam5JNUVtVHFnKzBE?=
 =?utf-8?B?UVFTblU2cVVwdEtNclRVZklxbGVZanpUTEVKbFp5d0N2L1lpWVNZK1VjYXky?=
 =?utf-8?B?QVEvYWRmTnBBbTFqNkZLTmlaVmtkdlRtMjlRUFRGYmtoWGZ0OG1WV3dveFB3?=
 =?utf-8?B?dWZ3bTkrd3k4dEVPVmYyNml5YVZlNUJUUjd0enFHYVdpSmt3MDE0SDV4Undn?=
 =?utf-8?B?a3R6Sm9tV3E3T055SEhUUnBybGpGc2JmUk5iMk12TUdiR2tDZzBOanU3TjBk?=
 =?utf-8?B?UnNadzZwV015L1UvSU56VE9tMGhxUW5icnhqeHRDRExnc1BNbXBQcHN4R2c4?=
 =?utf-8?B?QTRwVWt1WnpXQ1pHM0wveFIvSjFRdzBEK04xS1BiZklqaFhSZXg0Ukt4clR6?=
 =?utf-8?B?ZDFNcHc1cDJKWHY5blNtZndGTHdiMkwzT0FPQTV1cDJGM01Wd29iVFU5SkZC?=
 =?utf-8?B?cHRFZXE0clVWa1hoVkZTckZDN2JFSXEzRWNnR25ZSUZzMTk0OG13STB0cThn?=
 =?utf-8?B?TkpBZU0zbmZEcTdXbDlCYnBNTHlrSDYrNHNLYkVZOGNNY3NOeHp2ZDFMUkFz?=
 =?utf-8?B?WXcyMHgzUzBaZTZEWWpURFRxalJUcFFnZElSWGwraUEvMWxlUTNSc3dFRUpu?=
 =?utf-8?B?aDUzR2ZWL3dlUlNIeXpYUFN6WTRaT3NXYXNtaHRFNWFhUm9HNDJ2NmROWEpL?=
 =?utf-8?B?NlhmRDE0d0ZSM0Z4a1U2NCtUM29vK29pb2dENHlvMndXcjBSMk9jV0RleXVu?=
 =?utf-8?B?QzJxeDZlSUxkQk95b0M5VWZpbnRxaU1xa2hqNUlYa2FabzdzRjFyUG1td2M5?=
 =?utf-8?B?aVhmWDllRmJwaHRPakwxYUp3Q2tMaXdsdkRsaTNHS3RMZXBmaEk3alFlTnN6?=
 =?utf-8?B?c1ZKejFPSjNVbTkwRzcwbVhXZnRsVk5ab2dFSWdGRUk4L2ZBUlNBSXh3cjNp?=
 =?utf-8?B?OEUvTUhJQ05hMjhnQWtybzAyQ04ybDFoeEVOVjFndmhtMFpTcEdjbjFhckxB?=
 =?utf-8?B?dlNCUVJYb3hySHc1UjhLNVBUdzVZTkN4RC9uWmorQVR3Y21LVDhlaXpvd1kx?=
 =?utf-8?B?RjRWbE0vdnRwVWZnMXAvRkk3WE1YSXVFWkV2cWRFb0poUS9jU0tEaDV1bm1W?=
 =?utf-8?B?NkQxM2pidFk1U3NsNWNtKyt2aW5YaFhKWjRWUlJ6eWtoTEJyM05yOGl6SEx4?=
 =?utf-8?B?RUF2SE1jUmt3RTdsVGRVcXJYdGJYemZUam44VksrVjJtbWRjWGtTS0pZTno3?=
 =?utf-8?B?dStkYWl2cHBRVHpRNmFzSWdHMVhvcGhxcVFaZ2p2QXE2Z3AvdmwreEFOa3dx?=
 =?utf-8?B?cW9WYUdQZ0MwZngxTS9YNVlNRHZiNmZjemYxTmxSOUE4ZFc0blJBbytWdW0r?=
 =?utf-8?B?N3h6dFJnbFdBVEpvakdlaDlWYjlxK202RXNNRWppWFNyRG5CbURWd01HT3Jp?=
 =?utf-8?B?MGxQZ3QrVXlibmhuV2Y5dEZ5cmNpTVJxZlcrNTRiKy9VSmcxR2NRUVArU1RQ?=
 =?utf-8?B?N0hNWWxTYm9VRWJyQTU0ZkhtbWp6cUdnbS9NNDhFd3N5cHVqK015bDZNRDVy?=
 =?utf-8?B?MHc5ano5b0JLK28rb25VTW4zek4rYnpLWXdVYlNjRlNacTJPejIrZGNteGp4?=
 =?utf-8?B?aVN4NlN0SEFXQyswL01tdUdNcjRta3hROTRRZS96bCtDb2JoUFo5WHR6S2NR?=
 =?utf-8?B?b1NBUmVjMWxnbENLMUxVZEpjQmd1N0V0dG45NUNuS1oxWGVsbHBnM0EvckFR?=
 =?utf-8?B?VDJncnRJU09hbW5VZ1JhcnVpUW9Hb25Sb0dxZlp6NnZzZ3B2VDlmSzdYa28y?=
 =?utf-8?B?Y0hGb1FRT3NkM0NGNE1HZjZaSHB0UnVGNzZ5ekRsSjBycHBFWitNUWVZRkpw?=
 =?utf-8?B?cUxxQnpHNDRLS2lsZThoMFVscGVyWkg4MDRROGRQRDRBOXBZSk1laWg3MVdV?=
 =?utf-8?B?TGsyUnZOck56ZlhUbEJsaVRNWjh1bnJPMmlyMXRnZ05vVGVieXZOSFdQdEli?=
 =?utf-8?Q?2k3MLHV9xYSF1GaeSQKmWLkqIxG5fYZOdJR48?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cb5b18-973d-4f63-4424-08df14ed1b6c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:54:31.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVc276IlkpnxSjZlWf9jF2kfkrGq93jmSrJt2QL9FS7WRVUCbQVGlcU3PMmXVk9eG3QtsQOghGNk4FiZhtoZzYykGy/KDP6rScmV9Ndyb6lCVTMrBbtahOPMVG5mLrT6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9235

On Wed, Sep 16, 2026 at 03:43:28PM -0500, Rob Herring wrote:
> On Mon, Jul 20, 2026 at 4:24 PM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [High] The `usbphynop2` node requests the wrong power domain (`IMX_SC_R_USB_0_PHY` instead of `IMX_SC_R_USB_1_PHY`).
> > - [Medium] The `usbh1` node is enabled by default (missing `status = "disabled";`), violating SoC `.dtsi` practices and causing unconditional probing.
> > - [Low] Missing required `#phy-cells` property in the `usbphynop2` node.
>
> This reported issue is now a warning in linux-next. Maybe the other 2
> issues are valid too?

Post fix patch https://lore.kernel.org/imx/20260917145803.838836-1-Frank.Li@oss.nxp.com/T/#t

Frank

>
> Rob
