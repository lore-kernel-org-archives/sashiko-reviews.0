Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA68414430
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 01:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855394; cv=pass; b=XcOd/KL7ax5hQCaXbCpQUZMOyTkzFQyJrR59odCuZAv0Nax7cpQtgnkfUU4R+Ny7GgFCiqnFbpn76oTCBFwwZ96UPzanhLk4MLAd7/KgB1MSjlr3UATutMuGeYpOsVyF7fpBcGTlw1+iVXZWQz5xw1QdnSd7HAcBsG4nwiWwx9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855394; c=relaxed/simple;
	bh=EkzJMcykE7vjth+duXi+zPnQKK1JLwAYUVof6xmbNqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebXTdmvzkB8mz8RsD58aQ4V7NneRYzQZZ/L1ZKxBy1cra0n85m156ORNiSuQ+XCB2G8o/Mwj8Ff6nIiwloSso0BBJfNhLO6BLTPW2Gw7M5ggmwauSdLY2p2xJguYj7oEFYF4c7xcEVq+rec+DHsTKNawLGQ4CzdkyGysXTOtz9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PD4vVFX+; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PD4vVFX+"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6de2f213b7aso991185eaf.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 18:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791855392; cv=none;
        d=google.com; s=arc-20260327;
        b=PV0bSCigl5od55n6jV8EH6ZcwBvRC5JmaVQ8P6PHF1wOXP87rtYf76jh4Gq896meLh
         MEgQHyarDY/J4WGrVg+V371qKW9r9Cjk3wy9JwWuS2RSMjXd+tcfs4aQarshx0W5aDmk
         azvt24gBSGNrZEqgWCz55CexayRmwBtAqXgY1u0uU38gVNtcVqKWgyZ0qy3jYrv5U9WV
         Hv90QV0mXk+mXxz5OWHNVTT0rUtzsis/jY7YrcokVEwgonSK8QHX8ikZYUVIv07v/wy4
         85sIWlnDDOucb3ymfVKg99yWjYBNyfVZlyNy6KpZjlRQm/3mOT48N4iqtCy+LImSw7nx
         VmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pKqXzmebTfUCdHJlGAfv7ABK7ZHzZC9G3vJbb2Gw7Zs=;
        fh=hsEM7tOxqCFzgJ1ZuSj9IrmC8wyOC5gEKAFLAgc3jnE=;
        b=MCz+scsDDnLzta6hBQ2qOhUw6HrrJeo1kgo8HgiVR5O3Y8DCBlAdf5yO6zOIzvo6h6
         lSsCy5OLfP3aRURCunsau0Su7Pxf7S5bD9EDaWTBuyXC7G/h8aGVyTWb4FDoc4sw7HY2
         rcZtnD9L5BSf2hwo67AHZApZ+1kV6TkD35TBJPAd6d6eo52FdgGUe6oDwPNAqtJ+L1JB
         cQ1ohebhDsPKTgLEt3ccZVB/fS4Nt6ET1Rpw0vLbYxV3PDgjysrP9fWe0PbeiW0A2qMs
         fX9LLm2fmHidSJM5PpYIFxxjcVfolQ1xyeje/rxydcIczS6GEKY2msYwIXjZhhy2iLwN
         bCoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791855392; x=1792460192; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKqXzmebTfUCdHJlGAfv7ABK7ZHzZC9G3vJbb2Gw7Zs=;
        b=PD4vVFX+HjECAIK/pg2vXCl2iqS4u9+uMAMW75E+hMuI5P81O/rzWX1Q/Y/GCoBopq
         gZYvm1+MvJiyRJQ3voKyeVb67AfqWPKencNWBeO6DlFLNFlPN4JDCxrPuiOGE4WM1+Te
         kAgmdzn/Rn+d7oWQ78A/RjCmlJfNbH31QdeIm4SkTdTJPEYW+ddjr2o/ump8gmnyy8ae
         IfKi/R34qIcZH1/PR6uzlmad4N7hgkCkP6rnv9oOFsFUh5j5B9Jk4lqrf7cci/yte7hg
         ZJ0L96DtJZnzH+bpcsO9kSdM+Q45Xlh929kZzTo3Izn9Ka+7mYZho09VhnVz7XUC8W47
         fvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791855392; x=1792460192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pKqXzmebTfUCdHJlGAfv7ABK7ZHzZC9G3vJbb2Gw7Zs=;
        b=zBZowZEhpRTBjPShICbHc5o24mBtAyItLD23lx1y+RcQxLtwqp/vwt8xx5CzkwBvkk
         0aGJQroYTltuFO8ccB+XdOgFW28XZpf+RORGMhpmrdAMy7WDInfIKnDwGdUjir12eExn
         n4f41XxRh9hl9b/s82u3phLQOIRujRxTIuF5QqxRBGGZHzKuIJEUBrQ6Yw3s/JWWtmww
         TXZAZ+pgR+66X3/d9c6Jq/4+Ze1eRKNfTTkIL9Z0Mg9U9IZVBjWOHlxfqSxsKtsuTphC
         5cPbXci+VPdd1LkfCF/9bS9QIQ7vvz6JN0wlhxqbxmehS8Fs20kiqwLdrodvLcjrgIbJ
         qNFg==
X-Gm-Message-State: AFq9FYJDGn4LUd8/1p0/2qQDJdvSYuVLEd8y5IJs7qXC+bfXrOSnCpLq
	l/tDqS0tp/XkezlJhWtkAkmjPSUMQJulp2McLckURZLycoF6AeGqBxFIaHuYSYTio3q60nOOxLi
	X0VGP0Dk6uzJipk/F1DdwhyYIm5gfKeq1PvnkF6AlXMmUvxdFXK7IvyvsoIg=
X-Gm-Gg: AYBFou1L617KnkyNijwS+10t/Z1aLvvTkxtgTv3NTrch0IGz6mxYq8TcY0C0Z1x++6j
	o75iaeJ8o2NUX2n1yr5TazzopYDqDNfHkEIZH4vXqSCt3Luftbfmm7m4c2wc3m+rtRQKK/nJ34x
	IAEYcUAQl6LzUpvBOeiuUl08UA7n5eZAcu5PiLtxUsSWvtmsXQrxxIqxq+rvBw2XdrBWjf8T6n/
	1hGBPYuUGWjUvfhCqPp1SnvHrFro41eTU8x65iIcV1qRFlSz5stEQg5BbVwPXHWldZwKV+9kglf
	3QUsj+POFgkTcs/Fgtvf66IgFOMDXNaHsd2zKSTY6un+9ckw7lUv/oXZ/Oc9OWXda/vQ4M//ALN
	e1QrPEY7dBnwOROmwiYDgz+oh
X-Received: by 2002:a05:6820:f016:b0:6f9:59ee:cfa3 with SMTP id
 006d021491bc7-6f959eedee0mr915580eaf.32.1791855391403; Mon, 12 Oct 2026
 18:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012161135.494544-1-metze@samba.org> <sashiko-outbox-168385@kernel.org>
In-Reply-To: <sashiko-outbox-168385@kernel.org>
From: Jacob Moroni <jmoroni@google.com>
Date: Mon, 12 Oct 2026 21:36:19 -0400
X-Gm-Features: AclHuK-jVCvZe8_OBvJgwJYuqaxwdrpyyQzaU__GwwI_h3hVSQDw_8kD632addk
Message-ID: <CAHYDg1SOnqkLT6rfJCu8=gB=s_NY4xR-BpbpN9E4VS-h_nRaoQ@mail.gmail.com>
Subject: Re: [PATCH v2] RDMA/irdma: always route IB_WR_REG_MR through the
 allocated PBL
To: sashiko-reviews@lists.linux.dev
Cc: Stefan Metzmacher <metze@samba.org>, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Nice find. I was curious why I have not hit this and I think it's because
the problem might be elsewhere. Or rather, there may be two
problems. Looking at ctrl.c:

    set_64bit_val(wqe, 8,
        FIELD_PREP(IRDMAQPSQ_FIRSTPMPBLIDXHI, temp) |
        FIELD_PREP(IRDMAQPSQ_PBLADDR >> IRDMA_HW_PAGE_SHIFT,
info->reg_addr_pa));

I bet that second FIELD_PREP is supposed to be shifting
`info->reg_addr_pa` and not `IRDMAQPSQ_PBLADDR`.

That incorrectly chops off the upper 12 bits of the DMA addr that the
HW uses when in direct mode for FRWRs. I think it just so happens
to work as long as your DMA addresses/IOVAs are all less than 52 bits
and the lower 12 bits are 0.

If that was fixed, then I think the direct mode would work fine
as long as the MR was originally allocated as PBLE_LEVEL_1.

However, if it was allocated with PBLE_LEVEL_2 (as it would be
for smbdirect which uses max_num_sg == 2048), then it ends up
using a completely incorrect value for `reg_addr_pa` because
`*palloc->level1.addr` ends up being the leaf PBL's HMC index
rather than the page's DMA address like in the level 1 case.

So, I think if you did:

-  FIELD_PREP(IRDMAQPSQ_PBLADDR >> IRDMA_HW_PAGE_SHIFT, info->reg_addr_pa));
+ FIELD_PREP(IRDMAQPSQ_PBLADDR, info->reg_addr_pa >> IRDMA_HW_PAGE_SHIFT));

and made the post_send like:

    if (iwmr->npages <= IRDMA_MIN_PAGES_PER_FMR) {
        stag_info.reg_addr_pa = (palloc->level == PBLE_LEVEL_1) ?
            *palloc->level1.addr : *palloc->level2.leaf[0].addr;
    } else if (palloc->level == PBLE_LEVEL_2) {
        stag_info.chunk_size = 3;
        stag_info.first_pm_pbl_index = palloc->level2.root.idx;
    } else {
        stag_info.chunk_size = 1;
        stag_info.first_pm_pbl_index = palloc->level1.idx;
    }

...then it may all just work, and we don't have to give up the direct
mode optimization.

I'll give it a try later.

Thanks,
Jake
