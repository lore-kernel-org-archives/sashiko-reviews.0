Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22F0823DD
	for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 00:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779497014; cv=pass; b=iGLaiPkhy5Tb2p70NCzlN+OJhq67z7Ai8Ipc8j5exCdAIMlwhnPkIot/6v6MZ58rEV60ihNxEMWqBvinMrpyP+PgCskP5HMXrWJ9xrdUZqpIR1rUwG9E9V8AJePtfqYAVJCXYpWAKk3RJCdIZnd1CoEGftWdshUIOA35IJMP+qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779497014; c=relaxed/simple;
	bh=fRvAKgto27u5Qw0YVnZl37234t9t9ZLTyQoH4JF6iOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPgX7spexrFLBZPq2bO+N+owPofewuSIahC40EHRKk+URqwAsRYBYSE6pdmo39itwitDwX8Ww7pulMUEGvlnEb+ky2QuqD4zBQx1ERAmrumwdEmiqsMaBiUyQSlH5OlFX+9UZ7X8r83ANdS5g791skXj7lSJd3yhVxvaVrVUDvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bAOMqeMi; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bAOMqeMi"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1363fe80fe8so2660507c88.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 17:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779497012; cv=none;
        d=google.com; s=arc-20240605;
        b=foEzhxSS5TqqtVovP6ChhqGuEmtRcDdSj6FS2d9jtVJgCG+ezD4D6qkHCfOTA4E1HE
         vKB7WZNr9sz9tyKSQwsRbLIXWBmQ3sIogtI6M4+ysvKvddYF6FbEpO0oKLzKE2O6aF2j
         jxzsHry8UQ//Za/e2xqgtAWrhb8K4ElPMZYwwCoc10/ExS/J/ff7SXvprk3VviACzOBV
         9rEJCVhvTXXQDbAI4F2q7kb0zC4XsH5ThsWtm5oJeY/KjvKyE9/g2iCVGMiZY+ssetAA
         FV1jbHCZtDlm3yjGFfWXrWbzZYg+cFNde+n4VxdtXsCnlGxGEqthKHNCRmyz+2H9fQK5
         /goA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q/GUzFl9apaO95CDtIhr40JrpKgtUpGRXRASP5KVz0c=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=TD2NbIkluNsOW5j+AlcioIG9hy0OTZlX41H+24fIK5RBX8C7TodXdHTGkQPokx2pV/
         2pQvASgEIS77u7vfHpNTxX5W+ElUxJvqyHKIvJaUOFIcOj5/mDzdtrmkMSetKnGPcKdE
         agsTE7RhQKYgRNyFPFzZAjKpBnh3QG1S7en7IVb9PrLfG90AYadtVh1rEIQIN7V1+cqX
         fTvyva1W8n/rge89uu9PvvrMz8Sajc7nSUjWP+LXIZ30ol7zoC63/0sFoWvKewZ/ZLBa
         BU6KuvBjZtEaYpF8rEONg6M2wtROu0wfqwleYMF6jEgFiPEHJIOKNA53uhaFe+FvOvov
         nH0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779497012; x=1780101812; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/GUzFl9apaO95CDtIhr40JrpKgtUpGRXRASP5KVz0c=;
        b=bAOMqeMibG7Jia/+WKoOrUC/cZRgRe9uS+Cq4yD+2vf2HUTEIIXyJ2mSPEHBAxyEz8
         aWpYpy3B80CyJBeBfG8hT77pCxiApBi991P+l4v/OnmZTtHdeztm7LnD1BbI9hSh/SXX
         XMyWFvwnYO4l8BEpXKFJ9eIhDXoUCQEkHyqKcj/G07GYy3LuZZxc5hRYTZFc/CXAtGyG
         vNn69hyjp6rSqNdcEZtuw97Q46vUUpGe5pbLMNlXZPFOvO0/m7vsV5NjWLack2nJNA8R
         DvCalN4MiWkYhzLcMdmSbCjZmns+613OmX5a6a/q6AzxOy62U4i0b2oFG06L+iVHxyno
         9DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779497012; x=1780101812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q/GUzFl9apaO95CDtIhr40JrpKgtUpGRXRASP5KVz0c=;
        b=kCM1wxrTG7whS5x7dPNDtOt8RezqOw8TkQbPKcjjGQAXVMQmBNrKlSc36X7HB8cZIa
         lhscDmXRnI2jkAkywrztcBe3MvXsjF4u6NvNTRv9rpvxZR3ehDY2Mt5zunNkS5CM4dTN
         /WNfQhC1cL/6mmg+JkfY+aOljlOTrdMbCHtZK8MYlM6GHOva5q3Wqgy86wMm1R59+7tn
         lSJgnlJWZAR1JS5npTuuoWEk+b6Ui5LJmZNc4cg7vR9waIbbQ5i4pRPheaVjJ124fwZo
         7YdT40VQvahnU/LCdjcdrwNJZTsJVT1Dq76MgKBzZIjTtHhpJX2D3UosjtcqB2+1PQW1
         hoyA==
X-Gm-Message-State: AOJu0YyoXC4iAeglg5LW88ACHItzKEbchJ4VwTdCSL/wmrk13/AXG36w
	2EXZ7MCySPT9l4ldWgcfpq/MblSHY+U68+HZn3gKIun7ruEcjHoTtTHkPUblRGMQYU4PTbxxHiz
	8nhLTB3OpGKAcQR9cKa2mrPUzIfN6mGBS4FMKN6TNlyeYzkAunShamrUAhos=
X-Gm-Gg: Acq92OFqSOAhIfLK81hk43U/okxRKATDd24cxfb2LYHI78U/eNFSXSm6HrFfTr1pvjD
	m6DttYmnyLjqsEsnFlK9mrYA+OYaD0IfjD8vffBpg7PP+6MxIQ46qm/4DXw8oDloJHmhp/r3Sg0
	sR/O0XwJsPY+9Y3RaU5sHzqsqJ+R718Zj1JTdhfHD77wS76oyy9Ljeuth03vqlFr6TWuAt0ajOS
	rXYAqkfywtZ3tF/bZQrckdON9rKIOOF/A/TASG6jR6VqCfpXFg+J6tulxPhWtJhoEjpLFtbPX3R
	V8q80G2i5y9X0xE8q1GQwJoQ5szuCxwRBF/aAvzFa7+rP5Ki1E0NQqZ6yfrUOwxKaWOWCKs/02m
	Ybi1fQ0yORjAkqysVOVDAyhgUi7ZdfLX2nPhyRvni5lkM18hN3QlCcIpBZmnTS6Q=
X-Received: by 2002:a05:701b:428b:20b0:136:959a:abf2 with SMTP id
 a92af1059eb24-136959aadfdmr149356c88.2.1779497011492; Fri, 22 May 2026
 17:43:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522074601.1658705-9-kuniyu@google.com> <20260522091815.AA2361F000E9@smtp.kernel.org>
In-Reply-To: <20260522091815.AA2361F000E9@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 22 May 2026 17:43:19 -0700
X-Gm-Features: AVHnY4LJwF3JrCpIIbZ495-ZcWE3wxzxjfEsOwI0EDi7fN5JnQdCe20DSmvA31o
Message-ID: <CAAVpQUD47Ga7=UPfSHk4VZ9mASDHKGbAMfaDGVQa0ZZATpKU3A@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 08/11] bpf: tcp: Reject BPF_SOCK_OPS_RCVQ_CB
 if receive queue is not empty.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 2:18=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf_sock_ops_check_rcvq_cb incorrectly prevents orthogonal flag =
updates if BPF_SOCK_OPS_RCVQ_CB_FLAG is already enabled.
> --
>
> commit 684ea4455b7f13af338937adb28643e76ddccaac
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Reject BPF_SOCK_OPS_RCVQ_CB if receive queue is not empty.
>
> This commit modifies BPF_SOCK_OPS_RCVQ_CB flag initialization to explicit=
ly
> reject enabling it if the socket's receive queue is not empty. It returns
> -EUCLEAN to indicate that the queue must be cleared before the feature ca=
n
> be enabled.
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 5913b3be9f1d3..883e4aaed49e5 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -5395,6 +5395,9 @@ static int bpf_sock_ops_check_rcvq_cb(struct sock=
 *sk, int val)
> >
> >               if (unlikely(sk_is_mptcp(sk)))
> >                       return -EOPNOTSUPP;
> > +
> > +             if (!skb_queue_empty(&sk->sk_receive_queue))
> > +                     return -EUCLEAN;
>
> [Severity: High]
> Does this check prevent orthogonal flag updates if BPF_SOCK_OPS_RCVQ_CB_F=
LAG
> is already enabled?
>
> Because the val parameter represents the new absolute bitmask for
> bpf_sock_ops_cb_flags, any update to orthogonal flags (such as adding
> BPF_SOCK_OPS_STATE_CB_FLAG) must include BPF_SOCK_OPS_RCVQ_CB_FLAG in val
> to keep it enabled.
>
> If such an update occurs while data is in the receive queue, it seems thi=
s
> will unconditionally fail with -EUCLEAN. This might break the ability to
> dynamically update socket flags, especially from within the
> BPF_SOCK_OPS_RCVQ_CB hook itself, where the receive queue is inherently
> non-empty.
>
> Could we verify if the flag is actually being newly enabled before return=
ing
> the error?

Makes sense.  I'll apply this check only when BPF_SOCK_OPS_RCVQ_CB_FLAG
is not flagged yet.


>
> >       }
> >
> >       return 0;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522074601.16=
58705-1-kuniyu@google.com?part=3D8
