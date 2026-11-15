Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794766062;
	b=Q7Y7bygAHNZoEZo6WtlNb3fp17z16A6U9UUaej9VQpH4qpE0vxMKTIwvgib4f27uqC05
	 SPsSYbSu4vAX8qUflS8lxmIyOVcVc8GhdlPdXzjBIykUd7vVHWnHwd8wWks9YYfPNhD6+
	 cztwitmcGtGenDOLRAUS0K3vzZ+Eq0JBJFhuu1L/sIlRjSbkBNY7C0QpUKf9//YWRj2fG
	 /8hM/UhekFs1toL0+AedRqelg8DBQEP5lLo4iih6B+Gq+4YUzK8eOHlRLJOD5pft5omHO
	 V/JVX4tH81Tvtylf126I/Qa6og85/sW3vEwe2yvrrKit1SZlMV/prx2ftJqal/KyQxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ODZ8mXroBKAV6W1gDkxOYZgQxrPGMytztzvd6zo+XoI=;
	b=SEeVSk+QONl96kDGn754TFVNoUyvG40IzHn3PMeLMeX7Qmt8zaRxuy/0KmkrOJzZye6R
	 h+IrFDyaal/GMFfv1goXrGpbJqOiJxNgXEyieaFWqsG/Wx7KVV6EQsAeXugPXeuqnFiC0
	 x8wol3XDUhDTKiAXhSJQ9C/dMOELgbP6HQIRR4rnoA5k1zRTXDXoZzb4RbgCizVdTTggs
	 ixvCgq++GU6T6SxfGDEiP1zEM3ulfn7D6sV161sp8r8BRwCX2pOPgjOofmRK77f7F9tP7
	 6nBuQfEvlEu7oGR2cgpTABRX2rklMtwYUvltb5G9hITokh/L9JMxUgR+t5Mo7+wDWtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StuiNpbg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D0C606A31D
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 18:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D0C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=StuiNpbg
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40e30c26a4so514643666b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 10:07:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794766061; cv=none;
        d=google.com; s=arc-20260327;
        b=szJSd9fHgMm7gIOwt2pgtGjNrTCzP62Wg2ViLc3zUuOoUQ3dyXe/ysc4AlHGxeCQKi
         vddW4vqarXvXjVwuKX7HukFqckWIA+88tXlu7UgVDVT/7G0/w+nolWsi/akH9rd78RxV
         /njEdZlxGs02xJmR50NZznbvAlR8oXC16CurBtXLwR0otVZviDewf1jCSIaoAPpggZpa
         1XB/tySki8LgDpnHVtVBWzUm6cJoKJ5nBHL/25TNqoB+6L3L0C7l5mJVCRWDezqKyEVU
         fJ4z3gB24UNTMl6KEfF4g+f0LE+MGPg+KIoOA4X2g3SERXlcdXP9K2h0BXbHgaYAorvB
         V9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ODZ8mXroBKAV6W1gDkxOYZgQxrPGMytztzvd6zo+XoI=;
        fh=XxBywMc4fvbRDJJRLdhVTa1FCtpJ5P1RSkjuBMcNSCw=;
        b=G1J3rFAcwN1YZwB1REJt46lramWx56nXJlAI5kx2DWbbZvdoCLyVX420TZU7qt5Wh6
         i/1Cb39y8ryX9tbDnu9TAgo3ojU0FDv+MvxYU4haT+YHQXwKFqP0HlIfOOPBLaUq5Hed
         Hu1nQJg3Ho4AwUERzOWxAbD2GpUQMmRliBdnXA35UoQ89jw9674biByUOEyOELWN5q7p
         qLVCuVsEKScqp6WaGr7G8WPMKsYgVriWPBHP01KRaG86o+5MTGv6I32s8PSDf561QZ4s
         5uryea7C/ikSripM4cXjNKB2dTkAD9+wR+rQhKaIr71qZrdISkURBJltz4jgG36ni5qv
         ab0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794766061; x=1795370861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ODZ8mXroBKAV6W1gDkxOYZgQxrPGMytztzvd6zo+XoI=;
        b=StuiNpbgvawHdUD0S4lnuSP//iU2FZ6F7zHxEuXbQBZMLR5vg0YNbOAk5qaJ3oh6dv
         85KjPpYkBnOVNOKELWq1EexNVR6i9hZyVLPduGeknTvYQlH5Z8SdmCqi25zS9hAezZoq
         vZoHYgQXIT7tHsxrDpPwsu5NKwtSYhRSKMui1mI84FQmziUYvBP2mF2TYLKW2F4z03+T
         1q4t4naQP7JURh14vcCHuzWCmwOcsLZO6rMEnxKJbC5AWC2soMjbDrAFtJSh2uMhTWP6
         xnSCAZbD1D8pM7+jJz7YGow4yEDN1gq9LjD27Kf5ezzHg4sfMqzBPzExBy4rKWYcYQBi
         3ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766061; x=1795370861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODZ8mXroBKAV6W1gDkxOYZgQxrPGMytztzvd6zo+XoI=;
        b=s9Z1UwPhf9Yj/AueFirouV3v8hM2MWJw4ljyak/UqAdpZr21YS5Fq8x2cKuGrQw1lg
         9cVL9nJfY7jT42ee5D/TCBc4Zqwrr+hgisWEUy79MCk2bSzLhpgp6YoVrQntfI1ugd1G
         CZLFVMZnj2gEmN+vA1ACbRHSndnpJ3c5WT03snFrZ3suEFMU3VXK/2iyuwPBPVoMkGVk
         4vV592liBUViJfdFn15ZfGk6vgdGFJpvrPxuiFhCdFHIC2YfzDVBeP80ExhGXsC/wYBu
         jcznasBibQDAMt2PfPOGOay39mqq3qMNTYVJL2rywcbKV2iTMCzJWleSAFBhd3QoRXNr
         unyQ==
X-Forwarded-Encrypted: i=1; AL+hErERa3r/5t4MJ9QWFL/DRMu5+YVxP16N9KOKXEwk3spVlaY/0qG5P2Vru+mFlZ7UQILrKtAmndUEmrI5JEN1dU4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/u+VXNVjk3mBLIBsH+Z8rYfxwDxs7SAiMyZMGRwjJRzcsnQYlt
	3mK2ow+UVYRZ+KTv2hDCx6MSZAyvAir0p6JF8Nn6a62moPvw3C8qHADt7AiGYqHcmJ6iHZZ4PY1
	Ilv90gZKORL0WtylzxZAI7Yy+0rE8Agg=
X-Gm-Gg: AYBFou0WMFYPTu069N+mtrNYAyJBWFQ+YRl5DQMQiuZFR9es4jxxA1VJF1s5zVI49zm
	prcmSbYm6NUYsw+tihw8xFbNhSJNBjuQx/YL67JYDlpQ5fWVE/Gp1aCGawebpox4PAYye/Lq92l
	l2C5NcIXWYj69/qIgCCDo4XpMouTZf4Oi5BDhpQmTqy66bPMMAub5F87tOuF75l/KruRHCuGupw
	ErckxrceUW4etj6T2En2qwFrqh3PUyFT4l9niVbIqtJ/qWCmAoj3dCPIPYmXNgPxuZTREgPac33
	tV2j0LM6k3AIXAS8tc8HxJO9e31RqdOaxIWw4oaG9eOu854oHCJ6fcSzAZpKz7f9OHBFKOMbK+A
	944oal3V24XJD2JBbmEFclh4m++tDOqTIvBJ07+bwxv2lv9tZfUTyAwIHrFNowMv4KRFwYw==
X-Received: by 2002:a17:907:da5:b0:c41:1781:a2af with SMTP id
 a640c23a62f3a-c507bc6aeddmr962657866b.9.1794766060702; Sun, 15 Nov 2026
 10:07:40 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <sashiko-outbox-215014@kernel.org> <20261114214438.70148-1-baohua@kernel.org>
In-Reply-To: <20261114214438.70148-1-baohua@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 16 Nov 2026 02:07:04 +0800
X-Gm-Features: AclHuK9wWwrM_zlQLCnEvdTqRJqqg87qbS7IMoX4RX9t0fL0_GRNtM-b0gYZBYM
Message-ID: <CAMgjq7DiH1SJCR0DMwf=16cxXO2PZcjSuD41sO7_2hOcXuPUQQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/16] mm/mglru: Run aging when one type is drained
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: sashiko-bot@kernel.org, akpm@linux-foundation.org, 
	axelrasmussen@google.com, baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, 
	hannes@cmpxchg.org, hui.zhu@linux.dev, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, linux-mm@kvack.org, 
	liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev, rppt@kernel.org, 
	sashiko-reviews@lists.linux.dev, shakeel.butt@linux.dev, 
	sidchintamaneni@gmail.com, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 5:44=E2=80=AFAM Barry Song (Xiaomi) <baohua@kernel.=
org> wrote:
>
> On Sun, Nov 15, 2026 at 4:50=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issues to consider:
> > - [Medium] mm/mglru: scan_folios() scans seq below min_seq at
> >   DEF_PRIORITY
>
> I guess reparenting could be a corner case where it's difficult to
> properly preserve the cold/hot ordering.

I think we don't need to care about hotness for reparenting, MGLRU's
reparent just forcefully squashes the old gen into the parent's gen,
and most likely in the wrong window order, the hotness info is already
severely skewed; there's no way to cover that until we run the aging.
In fact I think we should patch reparent instead, maybe later,
squashing everything into the oldest generation seems a more
reasonable solution for reparenting?

And if the child's old generation was squashed into an out-of-window
generation, these out-of-window cold folios will get evicted much
later than the hot folios. In that case we even somehow "fixed" that
by this patch :P, as long there is no leak, I think it's hard to
define what is the right behavior.
