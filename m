Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC947D95F
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341327; cv=none; b=EUroO+H4dbF9qSAbcasdTlDxhbE1UlN9TltqD53RoQmwhIPUcjc8Bgr5hl6ZMr6P8nMawBtQP/dcpiKJB8f9dqke33OJiIxNahfezKbsVkEcFJi6zIzejVFEX8/jAf5LMZq0w07BH/fiUfyeV3gkOHVJ7HV+owH3aaBV3o46ynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341327; c=relaxed/simple;
	bh=PgwRTINTEM4y8lTmvy/2+CXrZqtSovCear9tpRZu2z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWAGTUHiT1WvaT8baNTd0loWr7sElbLG9HZsmIPK97xWaenkLhWaUHPsB2l+NEboy7ZBLA/XjqWyIMPkuGW7g0ad0j8d2P0Mg0lDZQY8fVTGafXnFDgAhS0PWw3fBlvT+rE9E+Ys5KLF+KE2fXdcOLZ9QLDNhs5Qvb1jciGGs9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CME0x0+z; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CME0x0+z"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca696c4b152so376722a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785341320; x=1785946120; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vhbd/IauEGsMdaRvYQ8W1qczAGgnfc3VqSLPKIuT8vg=;
        b=CME0x0+zpdPTi4v199W+f1IMi5O8y1G9xJHNQWbxfnOIht/InvwZu7neysBuUWTh63
         /0OrB5Szr8Ll3Gz1gdWKndUgM2pnIs8HwejPBofE8B7jaXBmO3csdP+yHgsCiP+Flgpt
         UwXe2zDzCXcoFfJDT3iJ82sR0QEmTs8UEnbzP07Ui5ZLgJYGEAw/ajNeD3PD/BHmfpNk
         Qfc/QbCLg1vv9cU9ExDAKPW5eRRm/Oyx1lynSu5WNRmN/GZ90SrQR/yMpAl+6V3tH00u
         7M8gPFHn13c8eAMJsQqFtcD+fqqxnYKWfZ4dgSK6FwGacexj//hQ0cF7mpuwDxqSMh2I
         K/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341320; x=1785946120;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vhbd/IauEGsMdaRvYQ8W1qczAGgnfc3VqSLPKIuT8vg=;
        b=XCOc1cyFpWIEAL5zrDFEZDM2HXWeHqLB316FSgQ8hyvNXkCNnyug4QO2l0aUXUJ5xU
         ovKnlqQyaCn4tWf9sSffk6G70xfYR3YPUKo1sWZmtDRY/iqyIlKsNBwgXdbB96UbhBAz
         HEslW91xw25+6FlYnttgWjX3tUMZ6ROjxX0BkbVP1Otbj4NoYPDtYQUArmygsWL2qVvf
         hieCuMRGLl8NSLDyKNoLZdUWC/nyDw5ldIuxUDhISJalXPyx4NJrJKEf0TJtDScEAGu9
         aGJ84g3tufM/DCMjWvYZjL3bFmuEyP6biIRPMMd6KZXmhZYkMWS6NbJ5lT0agFXA5YzH
         DzDg==
X-Gm-Message-State: AOJu0YwlByLUFTlZZssXBK8nJWE3zt+O1odStyTSRa2JrEp9qrez6SqO
	WRWOMuXbgbnzszo+UjW53X9yNRzgGQV8chKB9TZhEh9/CPgladISK9GQqINasdvaoxQ=
X-Gm-Gg: AR+sD11AFDDoN7PZS3MujA1pHNFDK0Ya8WvqMScwdtaIZJNt1M1TDtwyAVeHJk6njAf
	yubNaOoEYaz7xhGR/sjPb5Oq6/1rTrTeCWpCxlxksBt4LEe+j73gnFrrbBL3+rh/PnkMVdq3lH8
	znpDsyPgqmfAe0PJGCpGEfIzcDGU1VJ/qd1KWG1Gf1SKRDBJTyGwms8trwYiczI6Z9RTsLsYtdO
	4JPnEYeuzH1kDSVUvDjR96Dymd3nM79HPjyho9A4tlDUCE25MKFMEbGXJXOzoPrBqfKN9SvaTt2
	jMpdaeUPXuqgdFEnpP+D21Yq6VY3ED+x0aHfd0PRrzJeE3fpqvrjQJUkCG56AmSHwJ91CoZLCX0
	cEeoa58lJBpu+UzcywrJtr5daoqBL6RkfddquFHbejR4l+1Q8+5lJT2BCCa2zEYDuMAZeCs0TX3
	x0CWN7OdARH3/cWrqR3d3CEJaYsiBTtjTQiHDGbiRPRIYMPmduhH6CLA==
X-Received: by 2002:a05:6a20:d4c:b0:3c0:b55a:80ff with SMTP id adf61e73a8af0-3c8ac23c2a5mr9069215637.24.1785341319505;
        Wed, 29 Jul 2026 09:08:39 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:45::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba929728sm1064755a12.29.2026.07.29.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:08:38 -0700 (PDT)
Date: Wed, 29 Jul 2026 08:59:48 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net 2/6] xsk: pass TX metadata pointer by reference
Message-ID: <amojZw5ZTajq6Kqb@devvm7509.cco0.facebook.com>
References: <20260727161959.885642-1-sdf@fomichev.me>
 <20260727161959.885642-3-sdf@fomichev.me>
 <20260728162042.27EE01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728162042.27EE01F000E9@smtp.kernel.org>

On 07/28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] `xsk_tx_metadata_to_compl()` returns early when `meta == NULL` without clearing the `compl` output structure, leading to arbitrary kernel memory writes during TX completion.
> --
> 
> --- Patch [2]: [PATCH net 2/6] xsk: pass TX metadata pointer by reference ---
> commit 83fcec7a0c0075ec991849b8d99f6d6cd083c335
> Author: Stanislav Fomichev <sdf.kernel@gmail.com>
> 
> xsk: pass TX metadata pointer by reference
> 
> Completion handling needs to know whether a timestamp was requested when
> the metadata was processed. Let xsk_tx_metadata_request() update the
> caller's metadata pointer so that decision can be carried forward without
> rereading user-controlled flags.
> 
> [ ... ]
> 
> > diff --git a/include/net/xdp_sock.h b/include/net/xdp_sock.h
> > index 8b51876efbed1..06c081feff42d 100644
> > --- a/include/net/xdp_sock.h
> > +++ b/include/net/xdp_sock.h
> > @@ -153,17 +153,19 @@ static inline void xsk_tx_metadata_to_compl(struct xsk_tx_metadata *meta,
> 
> [Severity: Critical]
> This isn't a bug introduced by this patch, but I noticed that 
> xsk_tx_metadata_to_compl() returns early without explicitly clearing the 
> compl structure when meta is NULL:
> 
> static inline void xsk_tx_metadata_to_compl(struct xsk_tx_metadata *meta,
>                                             struct xsk_tx_metadata_compl *compl)
> {
>         if (!meta)
>                 return;
> 
> In drivers like mlx5e_xsk_tx(), compl is declared on the stack and passed in 
> uninitialized:
> 
> mlx5e_xsk_tx() {
>         if (xp_tx_metadata_enabled(sq->xsk_pool)) {
>                 struct xsk_tx_metadata_compl compl;
> 
>                 xsk_tx_metadata_to_compl(meta, &compl);
>                 ...
>                 mlx5e_xdpi_fifo_push(..., { .xsk_meta = compl });
>         }
> }
> 
> If an untrusted user sends a packet with invalid flags, causing meta to be 
> NULL, could the uninitialized stack garbage in compl be pushed to the NAPI TX 
> completion FIFO? Would this cause the completion path to dereference a garbage 
> pointer and write a hardware timestamp to arbitrary kernel memory?
> 
> Similarly, in stmmac_xdp_xmit_zc():
> 
> stmmac_xdp_xmit_zc() {
>         ...
>         xsk_tx_metadata_to_compl(meta,
>                                  &tx_q->tx_skbuff_dma[entry].xsk_meta);
> }
> 
> Could this early return leave a stale pointer from a previous packet in the 
> descriptor ring, leading to an accidental overwrite of userspace UMEM?

I think this is now addressed by:
- [PATCH net 3/6] xsk: clear metadata pointer when no timestamp is requested
