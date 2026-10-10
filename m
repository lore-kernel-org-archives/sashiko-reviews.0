Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E03DDDD1
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791612980; cv=none; b=K5/jV9/jjujF1RHV0wR979x+9wmqqEoIZau9cKTsdW2mUMB5cnW/ITqXiLIJsw3OoEDvvR7DCOHrhjv15HC/64GYY79KviZrtUUjmwA24DS4aSoBx8ckIl9qHme/GdppszaTLKldEswmBI23sXGdtT8G/QivLigub3D89PPTFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791612980; c=relaxed/simple;
	bh=sAHBXblxtfvymj/r9WkO2Egl5vhjNGPwFcUu/Cwy5wY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJ5czwc5Oi+duqQQVtI4UmeVo5ocdD4DCeLYWzOg/v0/jqLUDvJ98+1h3DZrd7auPuo454IVUnNwcLXff7SRNStfsp95bfJv63fAtdR7d+kZ8Bp2+y9yxU3egAs9JIiMVIb3Lh4TSLeksv0L/07REhrRlDknre7l40Qa+sx5128=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvPma2Ws; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvPma2Ws"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso2098585e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791612977; x=1792217777; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Ai7DttukfcLAD0XsmKyzCj4bzA5dXPXWlklqadis4Y=;
        b=dvPma2Ws+f/LBdhPvjb4HIAndQxhh3WiMH8Wk7VTodR6ezAVSZIrc6B6r0hAd84H+V
         R39D7utd5uyahTPO61Wkcqeiso5kHilsSAY+1iTB9wp/oWSUnJWrc+4HmgRGYPz841nt
         OClXnP8iTZfiFoWdzhlndV95toOi51g9Oy5HzI3MF2eJLZob94gxHugfC3GWiNGHo75m
         t8oolfbb6lP76nrIuej8e8XOl01T7ty+YCMxhDLvoVtPhYazLRt7pdEkQA7OWA4v/1Kc
         OQVV+Bgmvz8Qjm5I2yyTMomYiShp39C4MLbHERyZIWryhbFYCb7ctNtjt1/S5J+9mWK/
         Zr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791612977; x=1792217777;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ai7DttukfcLAD0XsmKyzCj4bzA5dXPXWlklqadis4Y=;
        b=PKO7uEHhrYgDBE8H/s6mwe/fw+lNl7CV7H7TeKY2/NKXSpuaCcc0K2Uh0oCQFgeIMh
         kGZnJjzIYxLTn9jV4W7Sm4m3F/gdYFT/9B0P5AjYEiYodYOPlp2XHkl3Ka8biDcxe4a/
         68twIJS70A+WCzUjcXuRWnGexokC5FQAtG/IPnlQ1kmfF8+4siwmKmBai9uoYm457D/1
         ckISK+6eDWO21QhgWCc2tPhYmlV87xH5C6oo2kDdLnfBRzz14jU8wHVTyjNNZxELA/81
         TbUnF9TFzZ8+dJVf9UVpSzzpAcEA9C6FAEmgAAKKC8SH970weogDJRUifJUOD4FW9Jrc
         IAGg==
X-Gm-Message-State: AFq9FYLrq4t6U5XhuewPar6UxOLaGe7VhWAaBI4z0iuaRRovlPTb0THH
	6Hq7o/S/+tPfgFIMIOZcU2i0U1tHozKz4+46cunF1bumq2ijw1S1Krn8
X-Gm-Gg: AYBFou3d892T9ed+DFosY0uKYHRguBp+2cQDtKQJYOcx46szWhWcipyntJ/EDeQ5zuD
	1zjGs7rq/GdY95X1sh0tHhFG8vv00TBjr6CWawKNTdtOy3Na6Odp0ca1X6mc1hYwwbkl6pFRe9i
	fQ75tZPgb07mNeD1Qae/Z+hJfQn/Tlo6khJTv2nsSpidWprOd+MZgoPgX8mxy+yNJtjv21mUtA2
	GjFtgDkArlxroiMFihrzmvJbEC9KhldlJTKRKy+fsSCyrwAhqJk5mEEKgGvcLQjB9Ohoah7E1sK
	1sqPKt8MFjyurxqxWdCFpodRIlI3sFteNyFrsDMZ3Rh0FeJ08XnfR+kfLSI7HzArcuDXb5KCw5D
	poT+l+CkeGs9nSf/Hu3ByJtETFKQ+gpkSLLYqoXtJVqrE9eEjBseaoZYNlSgRGqs42RTFZtTNwW
	9IFUGGkVNQ6RncIaLGNjpg211BpippvzqvI9AXhLTVW6VOxKtdR1v7uZzX44KwrElS8OMIoK1bF
	lHWX/akww==
X-Received: by 2002:a05:600c:3510:b0:4a1:7703:e549 with SMTP id 5b1f17b1804b1-4a18e4c3fe4mr87840465e9.26.1791612977178;
        Fri, 09 Oct 2026 23:16:17 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm122983085e9.7.2026.10.09.23.16.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 Oct 2026 23:16:15 -0700 (PDT)
Date: Sat, 10 Oct 2026 08:16:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Mathias Nyman"
 <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 09/11] usb: xhci: Rework and improve the TD matching
 and skipping logic
Message-ID: <20261010081610.7e5b47e6.michal.pecio@gmail.com>
In-Reply-To: <sashiko-outbox-165778@kernel.org>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
	<20261009151624.618967-10-mathias.nyman@linux.intel.com>
	<sashiko-outbox-165778@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 15:34:20 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] usb: xhci: handle_tx_event() halts >1.0 hosts on bogus MSE pointers
> --
> 
> commit cc3554d902e447131e844c7826abc9b1b4f75f82
> Author: Michal Pecio <michal.pecio@gmail.com>
> 
>     usb: xhci: Rework and improve the TD matching and skipping logic
>     
>     Matching events with TDs and giving back missed TDs is carried out
>     by a complicated loop. Replace it with a simpler linear logic:
>     
>     0. Having verified that 'td_list' isn't empty,
>     1. Scan it to find the matching TD and count missed TDs,
>     2. Perform necessary adjustments for corner cases,
>     3. Give back missed TDs, if applicable, using a short and tidy loop,
>     4. Check if the event refers to the expected TD and proceed as usual.
> 
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> > index 7597ef8105c65..243b1fd2b2f68 100644
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c  
> [ ... ]
> > @@ -2858,66 +2861,50 @@ static int handle_tx_event(struct xhci_hcd *xhci,  
> [ ... ]
> > +	td = find_td_by_dma(ep_ring, &missed_tds, ep_trb_dma);
> >  
> > -			xhci_dbg(xhci,
> > -				 "Found td. Clear skip flag for slot %u ep %u.\n",
> > -				 slot_id, ep_index);
> > +	if (ep->skip) {
> > +		if (!td) {
> > +			/*
> > +			 * xHCI 1.0 allowed MSE events to have zero TRB pointers. Some old chips
> > +			 * also generate bogus non-zero pointers. We know, don't bother warning.
> > +			 * Missed TDs will be given back by the next event with a valid pointer.
> > +			 */
> > +			if (trb_comp_code == COMP_MISSED_SERVICE_ERROR &&
> > +			    xhci->hci_version <= 0x100)
> > +				return 0;  
> 
> [Severity: High]
> Does this code inadvertently halt hosts > 1.0 on bogus MSE pointers?
>
> By restricting the leniency for bogus Missed Service Error (MSE)
> pointers strictly to xHCI 1.0, controllers > 1.0 that generate a
> bogus pointer for MSE will fall through and hit the "HC is busted"
> block below.

Nothing actually gets halted, only warnings are logged, as for any
out-of-spec event that isn't known and dealt with. Specifically, MSE
are being logged since 2025, as we began to process them more.

One HW bug has been reported since then, in old Intel chipsets, not
sure how many PCI IDs are affected. Hence no warnings on xHCI 1.0.
Otherwise, I prefer to keep logging anomalies because it helps with
discovering SW bugs and properly attributing HW bugs to xHCI layer.

Regards,
Michal
