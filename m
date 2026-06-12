Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD70238E11C
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 05:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781242932; cv=pass; b=r8ohKuTigtkgkmvmoyVmoakt1cI6DCxYjXvTTnpTSlHtUt3Ii7+Z1TrnhkiPecYyAFrCRzrQ3zEgIkr363pwiYYjYAtlrvCmAdmuN7z/L02a3WLxn/T2CoLB8HKzdu8e4EGCWmELix3oVr6ClzE5UsYEirythvqe9kqRggjJVgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781242932; c=relaxed/simple;
	bh=b7ssKyEPRr2Vb5DDqAHfIT1SDpMFdyWHnpD92KViFkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9zvipxEwZ4pqkOHkwkUqCXaeSIFXrOLQiD9NRWrOui6jPf2cszapMi9emGQ8gYaGybjc0utv61ff5QYY6lan0OQd5JHJ1FiDxX+jmjsG9i/DLu1W79qh3n3x3G6vhbVVCAFkc9DqJXo/V2mrESjmjSRd4/57sYd/n/WnOBgUkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WDyxg+50; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WDyxg+50"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137335bc3caso771537c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 22:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781242929; cv=none;
        d=google.com; s=arc-20240605;
        b=kINsPrijEnvDO3HPf3bmrT1x77pvkYHy7NLXhQYpDsIZNOG0xBL5EE2MJKBsKPLGVP
         NumbiyzQvMQH+hQVzCyp1sH65Nni3dnb4t0ShHs6AOLgSE2XWMg/McpP1cxOJiBWyES1
         W0I3e+20TKGYwXZwlGNyzneVyFaoBQ46rDXn8HYVqStGRYvyUcyYp4+OX1aaMeE2jlOi
         Aelf0vFTcDA/7OoboQIyJtM+l9BSwFoQ317wyc0utroWyCkZyyN1drG+06PP+C5C4KPV
         NVLamzMUymdFvA2XNFQaxCOKm4oXbqtPdQa40kFX1KFcM9zKuMfUywOM2Tq7lnlJXd4x
         ZwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TJ1nugW/8fu1vZ5ssTBZ0A1vU90yVL1AO+VaIOxrxis=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=YzO3jiVG7z+v5vocn8Z9T6y3pjIrLGhjzW2zH4kCPYqpIz+gbTEcWaJHx6ZKuIV+sd
         nDX9jYM3wmfktat1P/gncVd4YDrIfHWtGCt2wZL/1rNxmmPGVZo2D0W683yxwqvhUcIP
         R1dny6/8YuUSgB2EB2XsOLvjjBYqZuIG2o/GD8Xsx+BmozO1cNDEdSHG6n07PoUI+md/
         n/7dy7nQbShZpawlBH/csLCNqoixGCfiYX8fYNmBdOTUfHJ2Lrxs3J8W2T2YQ3SuYoYP
         X2qSWbNTiogoUhokDmkOYRKI7Sg4TZJz6Hbp/+/zSeKXtbDmg9NK3Iq4iN+C9CDZxW3P
         Wc4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781242929; x=1781847729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ1nugW/8fu1vZ5ssTBZ0A1vU90yVL1AO+VaIOxrxis=;
        b=WDyxg+50Kd2fL5cg2kwi81BC9xBQtFnsipInu8qtO2WbtGcWsvEzsRFFD8pYW2ibIs
         ag251uAjOqYVWJw6zC50qjeclVt7rNMETZHfHI6Q/t0ha7J+3QVR25sNkLtwivFaZSql
         MqKxMpLToddCd/tPPAUT+v1XtyaeZzyHFYDszPCRCJNJB/VctTBFAuDDBypj1qmG1Cjf
         6GTczOlec459HOL0IFLzIVYN3MoYS8k3ESRh+/TNq33zxd8aaE0H5FE+getZJlSQRrSb
         hVSoMzCVPiYCHVZZ/zcBMaCaDZxU6vDwl1d9jXLf64Zjpe0GYt/pZnMEatj8/KIOKzK/
         8lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781242929; x=1781847729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TJ1nugW/8fu1vZ5ssTBZ0A1vU90yVL1AO+VaIOxrxis=;
        b=E/KRVHe6iH9D14Q9xI8yBlPtEwQwg8IaxqvFtjvdamSRrlclW7qlzw8dwn31jjGUdO
         C3wXnupHE7nuW0mCLnjaM1h9n09KictUY/yNm9MUKOtMkuaWsM1pzN5eA5+07p9ZE+5X
         YzeYVapd6dvnBT1NjIazKzKtqyhi3UDRgec+/RFGBY0ZUl0n53qI5ZAyFN78rcPD6aGk
         bU/Cc46lCy8qfWKI+1w57sYGmRZOLhCkZW0hwLmEa84vs5inJuK6/q1WJ0Couhw3qoHH
         h6nCFGfObTvWTToXM+j3IzgjgiJ76OWLHpIPS0dQYv5bYdi9hiQe9+psCeU/pqkS17i6
         YafQ==
X-Gm-Message-State: AOJu0Yz8y2MmUf+APAUgwIPuhRnIB+9vDXK3HbSYnXjnL7tjv/GZTwsn
	A82vBS6XjxxrZIwOaBlvQUE4WUx0RAKtTtbMcjp+anm+PYYrB1RypijcJMbrpvlohTHBmGdX4jl
	XXcHplyehQkU/HMGmg2cnDjfnu3vQdiq2frQ5my1h/DP2zVWOLQVnx/cTkWEuGw==
X-Gm-Gg: Acq92OH7nDS1llhkDy3f0qSM5EahEWvPos0ikxaTKuf5/W3UkjH8EEXIoc9UUlcs6pC
	R4u3QpmWgIzAnBbjyuHuqreCymGWV1UE5B7ZsxWD8TXn6b596sJ9AxMocbbuedLwlOj7JXsjAmk
	NatK5MFSmbn80Ip/EJ+tau5dPAOGhQC2qwfUyf2nxmbv8laW7mFJLNG5A4bmISQOWEI2spn3Omi
	4nJIiV//bGpdjFlAk2yJTZNTB7qn5+7Qmha+9VNIE1disE6CQKeRw7dXENJeR4W3i9BWB0DLU6/
	+nlbQc/FECcw72JeFeQEhqCatycx4Cchu+foN0YrwOzSH+/2wEhdVWVOp3ezqCOmyBSCBVaJVtX
	ETfn0ZsNVyIXzwPP/CYEQpZcwDtjYsK3wG2A/YOdfubWlSo9tLjnL
X-Received: by 2002:a05:7022:5f12:b0:137:f532:e34a with SMTP id
 a92af1059eb24-1384bb2d069mr412838c88.8.1781242928052; Thu, 11 Jun 2026
 22:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612001803.23341-4-kuniyu@google.com> <20260612003353.4977F1F000E9@smtp.kernel.org>
In-Reply-To: <20260612003353.4977F1F000E9@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 11 Jun 2026 22:41:56 -0700
X-Gm-Features: AVVi8CfEiVFr0M6hRN3rfWkjVoSVyBffGMIcU1eHrMLX4u0ZU-ew2qj-mdydr5k
Message-ID: <CAAVpQUDTfftqVVSrX25S=Rq=gWoJ5pgsHuf7xW-v_Pqtdm7cMA@mail.gmail.com>
Subject: Re: [PATCH v1 bpf-next/net 3/5] bpf: Add bpf_skb_set_hwtstamp().
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 5:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Unsafe modification of shared SKB data (skb_shinfo) via insuffic=
ient uncloning
> --
>
> commit 96bf1885d42f4593da3e164388ab66653eb4e518
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: Add bpf_skb_set_hwtstamp().
>
> Adds a kfunc to update skb_hwtstamps(skb)->hwtstamp at tc/ingress. This
> allows transparent proxying of RX hardware timestamps via SCM_TIMESTAMPIN=
G to
> socket applications.
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index acdc66aa4f27c..ab7adef9c0159 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
>
> [ ... ]
>
> > @@ -12372,6 +12372,28 @@ __bpf_kfunc int bpf_sock_ops_enable_tx_tstamp(=
struct bpf_sock_ops_kern *skops,
> >       return 0;
> >  }
> >
> > +__bpf_kfunc int bpf_skb_set_hwtstamp(struct __sk_buff *s,
> > +                                  struct bpf_hwtstamp *attrs, int attr=
s__sz)
> > +{
> > +     struct sk_buff *skb =3D (struct sk_buff *)s;
> > +
> > +     if (attrs__sz !=3D sizeof(*attrs) || attrs->reserved)
> > +             return -EINVAL;
> > +
> > +     if (!skb_at_tc_ingress(skb))
> > +             return -EINVAL;
> > +
> > +     if (skb_header_unclone(skb, GFP_ATOMIC))
> > +             return -ENOMEM;
> > +
> > +     skb_clear_tstamp(skb);
> > +     skb_hwtstamps(skb)->hwtstamp =3D attrs->hwtstamp;
>
> [Severity: High]
> Does using skb_header_unclone() safely protect against modifying a shared
> skb_shinfo(skb) here?
>
> For TCP transmit clones, the header is released and skb->nohdr is set to =
1.
> This makes skb_header_cloned() return false, even though the data buffer =
and
> skb_shinfo are still shared with the original packet in the TCP write que=
ue.
>
> When these packets loop back to TC ingress, such as via veth or loopback,
> and are modified by the BPF program, skb_header_unclone() will skip
> reallocation.

I missed this loopback scenario.

Actually I have another patch to avoid skb_header_unclone() in
bpf_skb_scrub_tx_tstamp() for TCP skb (skb->destructor =3D=3D
tcp_wfree()).


>
> Could this lead to silent data corruption of the original socket buffer's
> skb_shinfo? Would using skb_unclone() instead be necessary to prevent thi=
s?

Will use skb_unclone().
