Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF523E2AD5
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095990; cv=pass; b=I1V/YQOvPmOzT/CfPL8zSgcehRqims8wQHZo22N+wf6D7sV0oqvfrRknbaua0PSEXL5XdlJq84OgCyhQYbNK9TbhMbvVfAjZurxKMYL/IVeMYBJooiE/kDhkDN1hn6/gHNk7784XTjlIiP0zmSN+8f27MJKXqaJgU6INEPPmaaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095990; c=relaxed/simple;
	bh=CnwT4/j5fv+DeDtRFPNWlL8z+nuZTW/Y6juMWgr5UTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaj+wpvVj/G90jkY/OtJ5kLxCLLmCJrXUaqMF2/FJgwz9ZHp67VBvA1DZu/kxgYALgphtt1bdzfd1BGG7s5Sbltw8gpG3Y4zNPiCUrcK0cREphE0fP8xdMIGvCUec39pj6D1J78io1scCMlCAgvuVAq9RdVqp4jThXAQWopB3wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hr2H0SGM; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hr2H0SGM"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393da8f389bso20410741fa.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 02:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779095986; cv=none;
        d=google.com; s=arc-20240605;
        b=YqYpeI1LDNodM+WwzdR7pJ1d7pjSabxe0MS2PtVqb91cQvA/9j/Ah/+qOWX13sxVtV
         ebyKNqJ82ykOHz+iNb2pBh3xjz73NSJQiW+ZrUm9g+iN9hxEmYA8BZhxNvzfvm258spd
         X5xCf+QjrMjs4UyqAtFPeiP/KilNPofbPsY5SgxvL/H/S8ALU5fx/LqRG2skR0Ah68IZ
         yPDTSl/xEJHSyFOJpLv5rvE20e30mTbIqK6fKe4I1mgrqo/U/je2owtWmDYjvDkgAZG8
         d9u4H7BwfRvkPLgbR/M+xR0zDdx3xIX6xrmKZcmCOk/7CTD1podBXip9xRtZIAn6GwNS
         jr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8oKVlndyjRSm5d1QJ38g8kShcN69mqPrJOMQfWnQBQ4=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=fignk8KUybVwPtFC2+XsvHkbpYIx8VreQ5zgUd+Z5O9GwMFvEMYqLZWJKvu+zH4NJP
         Hd7eUybGDqfHX8Da8+i1AyphJIMv/rfUr6148I/NPsq+Vu7X0cWUjopNHggWx+h3bllC
         P5E7YxwdkzH9rFO9SuPpiw6a0BNeSdK/GCDnP94CGRh7bly3D+xstcUlBM4orhsdGBHg
         XByUWY0VXX7s4uFuBd1Z9AiEbu4mcaxDRByySOFmsFC6Fkh0T69hYTEIEhW7X7A7xwxE
         OBSZny+Og1rgVs8xLRLDGRI0bPNWwOSi3txCictgRcUoZqrNgNtUQkRHkLM06CX6lPWq
         /pSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779095986; x=1779700786; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oKVlndyjRSm5d1QJ38g8kShcN69mqPrJOMQfWnQBQ4=;
        b=hr2H0SGMPbzd4ZQQFA9GAycOvdAI8I+ywIR1Y+BdWBhaJ5NHZO1epk69iuZA9dAeuN
         HbV7NMwb9/beS1aKevFKCtLZsYYq+l3bWW+qB+VJbqBLQBlkMwdfLIgWUYUbG/iVxo3i
         Ti+hphaU6RuN4DhI9VMmB4uFVuBnzyw6J4+7s/9qlcYRLlpZ4wz0cUnpPb+Ost79nLEC
         y5680HUPnK3YTVw0zFChO3ourBApeFnIqcZ/7JBd9h72DC44rwsjz/Q7ADU88SHhmul5
         4VoZtQHeImu9CUu0LQQu4j1enLRn1wXYGjJShLyIBjQTdQoqUdA4NT6O4VsnWVnFof5l
         xyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095986; x=1779700786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8oKVlndyjRSm5d1QJ38g8kShcN69mqPrJOMQfWnQBQ4=;
        b=gb5+qxgSpXcb/qKKdQ61GzmdIsRFNXxJOOat+YNfE9F59kuot4T3X5NX3g/oWImxnA
         5VStagVRi3L58NfEhdYnKZHOp73fJsoUFxi5B0H2wr++rking/k2Jzm/EGr/CAOH6PXb
         Zzu3uZWfSth4xdq8JIQevjRJA023yCbYeyZ1ZU6+bJiamm3MBcfsIaIIge14c70CSkns
         9T31PE+hp4y8CKbuK4gy2+cRQyBoDMrMyBdp6Bagq7zPfsbAcqS6JpkGt5dd/IYOpbUv
         sjUj7xHelokCU7pLgtI3xlIp7GC6VUXrFl2FjFXo46VGpDYinHvNsKNFycyxuv6fDONV
         GNGQ==
X-Gm-Message-State: AOJu0YyMAYTZ22NApl60VWMWxo+w6DxQjpRbRESssTlUvrlvNW8SKrnN
	1AKmU+LwXZDOTHpaeFaDJav2X16tCBqEE1xJ1XIBR9Tn3WsxwmVfybkLwkWpI/abiaz3S/uDNkV
	bW9vhdlPcon3aNnck+cK8+uBCNLOdlC+SUTwAaL9mUuH/
X-Gm-Gg: Acq92OFl0AvcFHNQN9H/Y7plIUpTj+y4MWhbooKv2NxlPp9UwFMMgu/4b2IxQx06r0H
	K65IBLNHxoKxEMftItqr+k8OTPYccpA3i4U7ZL7wR8DWmjMEpsClqp7EkrkBz4iH6vZH8mA8EaR
	pzLawPDUajA3FsCKb1bYG6A2+fv4HhvEo3RTGf9ZcTEu/TtY0Mzi9YBY74mKMh2uJlsk6UQgzQ6
	xDuliU4+oB+DA2RDvrNiubBYDIX/VmIvNHWYYoFgALuJQ69CtQrtW5DC8GDuOZu+gNl6hUCZ+Tb
	AwEmuILQOgJSC8COAxGVjQ3QBa3rOWra/rtwG/Pb
X-Received: by 2002:a05:6512:400f:b0:5a8:97d7:8c45 with SMTP id
 2adb3069b0e04-5aa0e73f2admr3639645e87.36.1779095985952; Mon, 18 May 2026
 02:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517063311.28921-6-kerneljasonxing@gmail.com> <20260518063408.EEA18C2BCB7@smtp.kernel.org>
In-Reply-To: <20260518063408.EEA18C2BCB7@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 18 May 2026 17:19:08 +0800
X-Gm-Features: AVHnY4JpVNBI7i63KPNT8vcPuVNlZxz95g7r0WhIXmRC5pRncmxLmDuftdPRNG8
Message-ID: <CAL+tcoDzmU942WOxeX7j=fdn8Xd_itF55=bg0RMv32+Bfx_wbQ@mail.gmail.com>
Subject: Re: [PATCH net v3 5/5] selftests/xsk: drain CQ to wait for TX completion
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The racy drain loop in `wait_for_tx_completion()` can exit pre=
maturely and fail to drain pending CQ entries, leading to test flakiness.
> --
>
> commit 25f4d14929e097cf7028dd26ec4e4bae16aa1a5b
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> selftests/xsk: drain CQ to wait for TX completion
>
> This patch addresses test timeouts in xsk multi-buffer invalid-desc tests
> caused by dropped descriptors publishing their buffer addresses to the
> completion queue. It clamps outstanding_tx to zero to handle extra CQ
> completions and adds a drain loop to consume remaining entries.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/test_xsk.c b/tools/=
testing/selftests/bpf/prog_tests/test_xsk.c
> > index 7950c504ed289..1f196c8ebc738 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/test_xsk.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/test_xsk.c
>
> [ ... ]
>
> > @@ -1293,6 +1289,17 @@ static int wait_for_tx_completion(struct xsk_soc=
ket_info *xsk)
> >               complete_pkts(xsk, xsk->batch_size);
> >       }
> >
> > +     do {
> > +             if (xsk_ring_prod__needs_wakeup(&xsk->tx))
> > +                     kick_tx(xsk);
> > +             rcvd =3D xsk_ring_cons__peek(&xsk->umem->cq, xsk->batch_s=
ize, &idx);
> > +             if (rcvd)
> > +                     xsk_ring_cons__release(&xsk->umem->cq, rcvd);
> > +     } while (rcvd);
>
> Could this drain loop exit prematurely? If the hardware or kernel is slig=
htly
> delayed in posting the remaining completions, xsk_ring_cons__peek() will
> return 0 on the first iteration, causing the loop to terminate immediatel=
y
> without waiting.
>
> > +
> > +     usleep(100);
> > +     complete_pkts(xsk, xsk->batch_size);
>
> Relying on a hardcoded usleep(100) and a single complete_pkts() call migh=
t
> not be sufficient if the hardware takes longer than 100us or if the numbe=
r
> of remaining completions exceeds xsk->batch_size.
>
> Would it be more robust to track the total number of submitted descriptor=
s
> (including invalid ones) in outstanding_tx instead of using a timeout-bas=
ed
> drain?

No, I tried before. It caused more failures of xsk selftests because
not all the descs are published in the cq:
1) address-invalid descriptors are silently dropped by
xskq_cons_peek_desc() via xp_validate_desc() without writing any CQ
entry.
2) only drain_cont descriptors and successfully sent descriptors
produce CQ entries.

Since we cannot predict at submission time which descriptors will hit
the drain_cont path, outstanding_tx cannot precisely track the number
of expected CQ entries. The do-while drain loop handles this gap. That
means this current impl is a conservative safety way.

Thanks,
Jason

>
> > +
> >       return TEST_PASS;
> >  }
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517063311.28=
921-1-kerneljasonxing@gmail.com?part=3D5
