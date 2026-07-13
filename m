Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013079.outbound.protection.outlook.com [52.103.35.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450EE4499A4
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972195; cv=fail; b=ZMZGPF6ajE0lc727Vl5swDLVG22ue48IyyNr1rwihEtciATZT+2sgKGlqhaeWr5gNySODZNsvm04Z4/b/UyABLh5uWay+rA5+jnAVaG466LHktXkzwCJ9L3VH1mjZKyfXNJiIPT0f3I0//q1L71jprqFwB7rQr7yLTn3emhNGy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972195; c=relaxed/simple;
	bh=Q0VSAzJ22pw5ADslO+/ooTFWIfMG1AucSyZNBbXC3O4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=a9fbe9NWOs+MHaW95OPYt1B7BogqUkEaR4iXegSKOz/ycQiVFnkwALlpGg+4/AEiQKxb58/hLvzZxc2LtnJYe1WEGqK8AK/CknblAarJ7xafd4PRToRtt1xsa8J/i1Dw61e4+OBCiMr+1sEZHW56QNUIHDOBB55aeP2CFk/UCFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=g5uOAUjr; arc=fail smtp.client-ip=52.103.35.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="g5uOAUjr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVWLickFXt6aGoFk7IbzyVnDmt/0t1sfnmHtRPGJz48L26PajDI+YHFDVVTBdQAC0J8ok70zw3NPfmirmyFRgxdcG5ehX9vzme8tipPa90T5SQ+vHO8tELjzft2GjObxACdzIuFiJ3if3wEJCmWsjNAq6RXOdAMmfcqvG74LOkdHLboFCjM3kdTgM8rfikFTSifXzpDiI7WAO5k8agKEireghj8KD2gKm/ghu1yPAky5aYCQHE9JnVsszrMsq/LcBXIVRf4hMX1MdN4P+Rw/lL97pX9NboqZO7cML/M1H6iNRhl4plUcoxEAbllLrn5y8VAVBwFCZ8hOeuAva6c7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKg6KkNHOjm8Nc/ZI7rIhGfJfa5PhJND0pvVtPuYRB4=;
 b=Rop8qArILKMUflTNpbv527PXd0cqpCHb5+clCZsAlF5ZpKP0myfnihi/3ZdD5N+y06kbH2LaCWyZ6t9dwx97V+8zraNUNa7HcPD0EnX9IJE5R2ixh39y1KU8FztiudWWZgXZkYNbAEWwoKTxhB6WmHAPr2/3RBjHnfUlKn1apcYw9MKTw974QuWOLmZgQ5nCM7YGO/J29LodA1FA4LpLalKrVURxvjJQnmkI6KF+tG6or1leBNfHjYds19DoHcc2Z5sR+9eKsuZZE8gqwz/y8AftuKLW0KyXgIgpTQy5j6Ps04U64HPNnuimxmuXoTAe2LdVqSUzpFX8NZkRHA2WSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKg6KkNHOjm8Nc/ZI7rIhGfJfa5PhJND0pvVtPuYRB4=;
 b=g5uOAUjryxliM/5JXHuZBkzmwfYdXH/n8u6zBQtd92YTTXNCVsVXxnSg3x9PNWyhB04imyMCuQdeGzNQIs78oH7b0nOHuf10WSl3OpBbTji9HXLnZdbdpUXnzCxDOd3MHfoj0MXeMczgiQSXiAsNt6lVleI2faOudigImIIlmmt8F3OX6LC7Pa5gJZxMBNItrv2n73K4uL6Y0j7TUm2mGNcxKt6VrUF9GdJCIA+NTVAYFMWFuR6IMDSTv2w7qmWm3Z32FYOOvyw9zJonBCBnIT7JPMFOg2F7AETqIl5uXxJVDZWSjVBjttnw866Zu3BiYt7HpiJ8ajOHvBI6HNzcLw==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by VI1PR08MB5424.eurprd08.prod.outlook.com (2603:10a6:803:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 19:49:50 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 19:49:49 +0000
Date: Mon, 13 Jul 2026 20:49:42 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: Xlinux-leds@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH 1/1] leds: st1202: add hardware-accelerated blink
 support
In-Reply-To: <20260713153713.962DC1F00A3A@smtp.kernel.org>
Message-ID:
 <GV1PR08MB849773D21A4FBD48BCA8F92AC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C5B8CEB2CE19743DFCFFC5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB84973ADB74B084B108FFE389C5FA2@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260713153713.962DC1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0259.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::12) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <59dde1db-f423-02ba-087f-6c234373d8f3@outlook.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|VI1PR08MB5424:EE_
X-MS-Office365-Filtering-Correlation-Id: 58358462-9516-4cbe-bc62-08dee117e5fd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|15080799012|8060799015|19110799012|23021999003|37011999003|6090799003|4140399003|5072599009|25010399006|40105399003|52005399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AUdhOZe/di78FZbwlT38UxFej8lZCRrqiXRh6g3WxkDVkrrRec14ICRjbuYu?=
 =?us-ascii?Q?EYJ/xMNhLt2zNd8r16zi85v1QmvtLyZ27moQ0iOp0sgu3w+uB3A8d22dUS0B?=
 =?us-ascii?Q?QDVqeRi9Lnv1raD1fI+5A8JCvSilY7PKDfr3zqXyPVWRl2LjAWrZimzJ55Wa?=
 =?us-ascii?Q?QJhqiVW/XozN8lvKCImMH0LZaJwBis2OD/tlQO1cUEbiMKePww5SXzKibgJQ?=
 =?us-ascii?Q?3ZnPK9By1XAsfrMjLM3sM9zv7PZ8LaMAzVrofI4Qp2IxiEakKYL4k8clZeqk?=
 =?us-ascii?Q?REB/dsZUyIsYaHr3f0Ke+u27jaol7H9dDsmGuPbpLujCmuxwmbtEWklaj0Wg?=
 =?us-ascii?Q?Nj2BPVgxI2x0+lD1M0C7OBdh0v6KfBAKctDQSWRiDds+eTHzgPex1ppitYgJ?=
 =?us-ascii?Q?XJGJYAhWxrZWL4S66UWa6T8daQpSe0mEsnZOkT9U4tWcTb5C/ELPWbgDiPNe?=
 =?us-ascii?Q?tVLKypWJ4zB9ribUkGasYLMjubujqTdzOfeFgvywwPivcEeVwGFIB/FaXtSw?=
 =?us-ascii?Q?fqFn20/DibeNHPfDH8RDE6CBFJ/I8hmi5azckj+TEoZQjwFeqgD2jptlbvWZ?=
 =?us-ascii?Q?gI8+IZ2KaNWRZYLfdXYY8QBgLXWBdccEK2BT82bznsJQqmt3Tatm0BQEb0Sa?=
 =?us-ascii?Q?2r93OwqgYkidrsxVhOpFvjif2hjjXtj8rqa9aDwpBaeTJ5iPmbiPqfYJ73Sd?=
 =?us-ascii?Q?0KryNXCD86MlKStURFx0vCmTmADP4VsbcVBE4ppC+eUoMZA3NhFp2+IKej5w?=
 =?us-ascii?Q?H+8kykVYZeBtnilQT8CuCVZ+goAfdRiv2BfqaCK000K5j1B6YJl4jgLpMpVd?=
 =?us-ascii?Q?MKBw6C5Kp+sUshDVyPi626+QD+9ZDOPH7au0GsWg8ZqMdlCUnqm1G60bXhtj?=
 =?us-ascii?Q?Al0jYJ7r++b8S8Ef6A3sIdXxbUdYdWoil/0i52truInBPw8dl7XmNnpAFiBp?=
 =?us-ascii?Q?FmU9RzCximtfwESeG++GIE9gcN/BQ1fNDXLzLlordnac08V0jiI1cwf0mJzr?=
 =?us-ascii?Q?hY/q?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HcZd0P87TuecPxCSg4j7lpqTiIgojrLZp/vhf2OqGsO97DtF83d5fvdsGW0A?=
 =?us-ascii?Q?vov+iZMYyONsMfdr33cyNhNt7Q/eyIvPydHjr72L6gbJMf1HwolyuVuhSDPA?=
 =?us-ascii?Q?xg3x32jhYOriwo1uwC68PT/8vfQvhpYAKBi3/sHczg9pM0B6go3cUehnmQYy?=
 =?us-ascii?Q?FMbKEo1N2D5jAO+2MS1UQYv8xrhFKg1jDK6aQLQxS1pUFNEsG7LKnuP5DxUc?=
 =?us-ascii?Q?q4CVdh+FDMcHtgy3vNB5pE3gJ4HmBVQ/g3EqsL/XYSBEg6aAyhuaNh/UeQ+6?=
 =?us-ascii?Q?+z2XYMktlfR3AtMVxtchvPLEkCo7+jgEwpjJ5rnCSVQiPmvrH38BX0Wo88EA?=
 =?us-ascii?Q?T3LEvxkgRGDyGJFf3DiviYShLSTxkF4lfeRim13cpubMspEQlzkeW9SOF83p?=
 =?us-ascii?Q?Fh/fw5NQl90JajwCSW7y5F7UmqhhMYfTHHHHUHPqM0lnSYq/Ctfaely+cAUz?=
 =?us-ascii?Q?0qAWi9yV1roGiWQwYnWgt6FFKgv6XUSY2z8iu/ImbilhR/1+Enbaz85hx2i6?=
 =?us-ascii?Q?IR7F/nMSBnLEEu+eT03/0m9+7IkkEtEEUL773Hkk/vizj9+My5/f9VZIJcPD?=
 =?us-ascii?Q?g2Yz6DMhvOfGmjFcDPLWh0YCRkDOARGO7aT33fPGCoFmpN72E6OmiSF6gd9M?=
 =?us-ascii?Q?CHVKM6k6oicjJNspkOjdcRTJsJBlGddoLNooM9NTmGfUJ1jFcy6xmdkAMf4z?=
 =?us-ascii?Q?Z+dpY6e9Tp9je6AUKyVpohD0+mG6i+ucjUYuCBhUefFjAcfqxh2JeUD5JUlo?=
 =?us-ascii?Q?dgHfn4E2cYPMebC5DwYApH+Gj7AwMAbNLcPnVPqW9vZ3ShzBUAncHy013zfP?=
 =?us-ascii?Q?ZzCbfu5mOuG7OvZRWtQzKm0tDa8NjJma6T3XtixJYLJdb/g1x5JL9VPzXh+w?=
 =?us-ascii?Q?Nq2amSrmMW3TPaJTlCOCZelOoydJX4dtCLCY/UrzSWVtmYxgT7nExNM4Zk+p?=
 =?us-ascii?Q?wkr5XewmmhSFs4vXBkWgoV5PGhydh9C9+rk9bbI2JucXQout9fLpAHtB91B9?=
 =?us-ascii?Q?MZvUfCIHOrh5KuqOudvocuOaLYoMjY0koRAB8XmSuyx/1tJWIzY/qIYQqFx5?=
 =?us-ascii?Q?jr3jcV6Y649ms80VksVsyJnKFlD9TJdh81f/+1bn87qtaWW77Lno0U46cuGg?=
 =?us-ascii?Q?4467iJ/G9CMnGWgBEZ04SvV8exJrB1KEgW8aTn3I8D5H4od7QUaOq9ayy0wC?=
 =?us-ascii?Q?G4Hu3UO+p8R4amyTA+EJX4qBvGLE7zB9vjpNzvGa+OySJXqu95aJqfr+X3Lr?=
 =?us-ascii?Q?Lxf7hLinC3URL4igoaiiB3iXq6QCLwQNZa5dZ9WKyxRbPRk+CJVbiQsbczTI?=
 =?us-ascii?Q?rtVtrlCC06h99N6hvnWXpxCJdqNuh1BiLkuQpog8nk0Plt9gDyd5FmcGiKrK?=
 =?us-ascii?Q?JSW0EQvdlxAVNVxXTQ7qbeKcj6Q+S2dBA617hpOrxTHBG0NYWs5Pvh/iUiV3?=
 =?us-ascii?Q?dmXL4yr39tUkupWP/fuWPgAuySRay0Cl?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58358462-9516-4cbe-bc62-08dee117e5fd
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 19:49:49.7673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424

On Mon, 13 Jul 2026, sashiko-bot@kernel.org wrote:
 
> New issues:
> - [High] st1202_blink_set() destructively zeroes the PWM pattern registers for all other active LED channels, forcing them dark and breaking their steady states.

This is an inherent hardware constraint. The LED1202 uses a single global 
pattern sequencer with shared timing registers, making it impossible for 
two channels to run independent blink configurations simultaneously. When
blink_set() is called, the shared timing is reconfigured for the requested 
delays and other channels' PWM slots are set to LED_OFF so they remain 
dark rather than outputting unintended values. This behaviour is described 
in the commit message.

> - [Medium] Blink brightness is hardcoded to maximum (`U8_MAX`), ignoring user-configured levels.

led_cdev->blink_brightness is set inside led_set_software_blink(), which 
is the fallback path taken when blink_set() is absent or returns non-zero. 
Since st1202_blink_set() returns 0 on success, led_set_software_blink() is 
never reached and blink_brightness is not updated by the core before our 
callback is invoked. Using it would risk reading 0 or a stale value from 
a previous software blink, causing the LED to blink invisibly. U8_MAX is 
intentional.

> - [Low] The commit message description is not capitalized, violating LED subsystem naming conventions.

Noted, it would be fixed in v2 if it was necessary to send it because of 
code changes.
 
> Pre-existing issues:
> - [High] The sleepable st1202_brightness_set() function is incorrectly assigned to the non-blocking brightness_set callback.

This is a pre-existing issue outside the scope of this patch and will be 
addressed in a follow-up submission.

--
Manuel Fombuena
