Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213083A0B31
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782648994; cv=pass; b=tCesno5FAw++t8JTDDPJBhbrzngWfFF65dVfgZ988P8hOWdTyBbN3jGwEYuWViC9tJpMi8uixvRrvr4koZyV5efs+X1Rp7Bk3j0bzmNVUPMg1vxl3+pBEDIKRkSmvNR4frwFzNiO8Za0EFLWZIdaZVg/hFh7Jqy0j9PBvPzmkYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782648994; c=relaxed/simple;
	bh=RMUcDI1StIDI+D03aa+iM8MljuIZTtn0DfooOOj6yjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYBCJ16zHMePIM2tQoxyAXe7w7HyYZPrQIKjkm06mzKJs2LpW0bhkol0RnhGjiYMV8nZlIlyEHaXMnw8OukaedgwjeL2dtKYoumVO76ob81/vREbrODneCE2nFulSN4fePZOexj4o6atPc3eQlZ3MiAQmDlQCuMO29Ji9Ojrc7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=cHcx9Ew6; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="cHcx9Ew6"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c88b8fe9059so853622a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 05:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782648992; cv=none;
        d=google.com; s=arc-20260327;
        b=scKIjrVp+IXUkzy2sQbtM686+eApN7sATgX0F26sB4nRw9d+/Y21VzwlA/qkCQg3OE
         3NtRzOOPCYyE04sT/YSYn5uhIgZ6aaAprgunVSK1UiKQNWk9UjHHcn0rQHN/nLkwj+BG
         j6Lj/WiRijcA8yqZ18QUJATez+rMRbvT5oR+MK3nFI5O2rAq86baAptNcfRpnnW1CZXn
         N+X7eLMhZsebccwXrNut1sbyfjs/Yg+4Qh5cH96HGDKI7rGxI+Af4i5rI4bCRzcc92aJ
         tPhg8PZrAydEh5KEE1bQmiGxbE7MEsM5yS56AqnQRPycd7l4ZrFTTyVf0FFWGfzqk3V1
         GHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RMUcDI1StIDI+D03aa+iM8MljuIZTtn0DfooOOj6yjk=;
        fh=1NHhrpVCiqRcEqYtXqot8+/0F+5WE7aKd/ewuCf6pH0=;
        b=oqqcURJjLe9f7uAtE6IPOg0I+J9BYaMPrmBPwH6KCVBQ8nVO64elf3oDYpY7B8nlLs
         YLKffXJze6fA7209fHXL/846opQeKMhavvFdhs8t0Ef2TVCSAWA5ibzWyUXP409b8EIB
         w+0NO72BjxfxDdHG63pXWfhgdz31cUzjeAdX8Z3lTBY7e70YMPcXuzZpjtNOUJlfPpkv
         MkMDPc6jYAhN/xS4WNJSOMFnMpHQZQTqZa5uxpHUbQI/UH0XJ8200Ui8It2bc2DtBwcK
         oyJMkAEvjFv84LIeJ7AC1EYapyeRxsjSD38VRIAMyHWffq4sa67uY4Ic3fc1lA5bCmPi
         fLyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1782648992; x=1783253792; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMUcDI1StIDI+D03aa+iM8MljuIZTtn0DfooOOj6yjk=;
        b=cHcx9Ew6zS2wD4cl3gcvdzlkdy07wip4IYZl5h0/QhBWtpPCopvruv6C1EpN61z+2T
         4vFcyYsUvnmSXzNHP3kvfVrVADHuLGzUcWmf4xYliNKJpHNCimaYFwdTZu3qEzxQSRph
         na1lS1qEuMogX7VDrrY5mkLje3nOXB0d220L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782648992; x=1783253792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RMUcDI1StIDI+D03aa+iM8MljuIZTtn0DfooOOj6yjk=;
        b=Dr+GTo4NWFcqq5JWUhVAiCJbkPNMu7NszaatdnL21n9tU8/dk21YITzO9qnWuNMPdB
         HNk4sRFwBIcflctOYcE/3Ulo4Z9CDNr1FLQoQIVLyo9rFmOJvAYen9XRTn/MNwxp78zH
         CDQM/gCkkWyQ9lBE3HCzAk/CsgielIxh+9lViQkVWxyHmoe7/FCA2GwSO01XnUsUWtV8
         bj5uM2khQwgWdgYO4muyHi1bF8i4xQr326PCSfyB1EMIvoTb7pGLUF9lW27rpslaE/pM
         9BkG9K492FfxeJU7aBRenzCAVL3FyxJ7Kg3G0meIRxT6zJnxaE4Lprvp9NYJsqbrsv6T
         rOvg==
X-Gm-Message-State: AOJu0YyslHHLC4tGbinY7f8fPryKmA/XdYMuhQyqOLDvYXJGPd89lQva
	aS4sUXvCXqItJy9qXZtfah27Mpq/Vz+TH4EpsZQM2RogC8BcqeRGaDdJO42WDUYNA7LGMlQAF5P
	KmXBC6wc32+wEkFIk34TSUC1UYXFHkRYT1p0V8GqnGhd2GmPmNwA=
X-Gm-Gg: AfdE7cmHwioWk9FvgbSJ+sl3dz1iLTvK2qgw5kIqh3gbjF7mr/tAcIjftOpS7H2N1/c
	Fo5H9S9Q+fxB+CV7H/vQfN+1hVoghDmAtJrS23u/m5TLj4JhkIkg01t33Pkt9LRFTgu1R8V1mGg
	wcSLfd5WDCIcWGzqn4Zt37taRAqLiIKcA58pRYb1tFiBdvAVZ78AOoobHMf6SrJSBZldcqXAbhI
	V+a7kPpOyHTw+JBnQKWUkCeb1Rh7I1BDp/qC/FEf/8M10dd/JULKXX9Yb8VVO/4/p/gvGsIr/Tl
	aDDFkJcq
X-Received: by 2002:a05:6a00:94f2:b0:845:bcf0:118 with SMTP id
 d2e1a72fcca58-845bcf00accmr11132513b3a.41.1782648992308; Sun, 28 Jun 2026
 05:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626165156.169012-1-jhs@mojatatu.com> <20260626165156.169012-2-jhs@mojatatu.com>
 <20260627165218.959371F000E9@smtp.kernel.org>
In-Reply-To: <20260627165218.959371F000E9@smtp.kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 28 Jun 2026 08:16:20 -0400
X-Gm-Features: AVVi8CfK6ZQWPR_bECyYbUG-IfHbpb8Amli00uwF06yQtXNsZDWtTMw8GIyhK3k
Message-ID: <CAM0EoMmgF5HFuGYWAg3Mrx7tP_BWzjuu7w9UVsr=R9soV3fXLQ@mail.gmail.com>
Subject: Re: [PATCH net 1/3] net: Extend bpf_net_context lifetime to cover
 qdisc enqueue
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, netdev@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 12:52=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The patch moves `bpf_net_context` initialization to `__dev_queue=
_xmit()`, but fails to handle asynchronous qdisc enqueue operations (e.g., =
via `netem`'s `dequeue` function), leaving a NULL pointer dereference unadd=
ressed when qevents execute during `net_tx_action()`.

Indeed my lord, this is a valid point as you described below...
Even though this is a pre-existing issue I believe it makes sense to
fix it in the next version.
I was too fixated on fixing the obvious issue that i missed this one.

cheers,
jamal
