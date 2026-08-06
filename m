Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8910390990
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023937; cv=pass; b=jnSI7rzThMMhjlXZDq2T0onOKmeBnDRkdv7RQwA3DdxZKvoeh4Ub++6AXJjldDS0jbTiAJWs8clUjrFGA5xjfgZT29UDj3otYRvgijojiBjxhueQ9xQC6fey1r3JBbemMTk4+U2TXIR6pFUApjyHrpuMTdQyAjufHElgl6WcAG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023937; c=relaxed/simple;
	bh=BKWJTReTdw+LMAVvVwFW5qLVtx7m6cVom+p9AYVg2D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBdkDDnuI9A8lGCse0P/crCkQLt7dcIodjoTc28yAFrYWTnNkImH1rmgc5GjG+xsZ+vCa4BiTGoZN0tZJ3qN7wcudH/XsbUG/o3j+lpBqikLrK9zZQDmdeOa7hfNHVq7J0srTB/eFulYRaGNTCs7Fioa85+zyCQ8hdeA8ls4WLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SQayNvey; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SQayNvey"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e50979c71so219866385a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 06:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786023935; cv=none;
        d=google.com; s=arc-20260327;
        b=ARvlCSzf92bDgbGmJcwPzVX2XhId7wiB9l52i17J/poCm+HdtWwKacbGMe0ruT0kqt
         fBdRCupTD4sHxY8kLaE9GIsD5w1li7ElSlUbd3pQYrtX93r5i39AjHRgbRIX/Zn4mbHp
         AD0nY3CXQ88oGNqYjfJm/ZrE8LAYJKqZBGlQ0WXUYcv4hvXGQHmLbmzCl+vVSApiBzYQ
         ab2Q1DJbqLcLNd/tBfTHgbKXSL8TKYVW3FMqbcf+/eKmuBGeKFqk3vIY7pgxgAI9BEzc
         NeP1i0rnieR+jmcDt2fbUQam8yMgYDj0NtqRYlIBMUddG3IAGKrE7GIFBQiRqoLb9kkt
         yQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BSeHeIOsrbYVt/cFGZ3Mudq1FYtZux95e0DZcHfkyoA=;
        fh=eYeHeE2hobW86QTEBoWWTZ7t8YdhNVI2iRfiXg9mdBM=;
        b=rYVgU0wBLR4TXKyrLFv2/Ep19qZ/6k/CtBtykx/Asen/3ung+bo4AZsuJ5yetqnFPx
         zDfVbQzyEDQKH0ZvaQ/weDa+LB/R+6Yf/igfKHIrtgGHO2lilYR6OVScR0AWUrXDWpg8
         nhSGT5PT85ZDqv7E1AIe8XX/wD3DBrcgEtmv+1V7lWVZI1yLQg0fgXcN9jrlPlhZtEeO
         0iUPU5puVkDILxU9NuDgJrLEG/YCFfNxrYssSAEDjW7jtH/ivxaFLJ6AwyMg3Nd6uNbE
         HcjRad7c1OFMBipAz4klenIiG3hOK5T6ZH+/fjl9vgrjUYhPPP2oB7SyL6PbT8Md5gr2
         D5OQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786023935; x=1786628735; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSeHeIOsrbYVt/cFGZ3Mudq1FYtZux95e0DZcHfkyoA=;
        b=SQayNveyiMg8AY4oYQHr4A0oAQVYt299uABANMdBB5mbq/9sDobTB2xVoGCMwJo+Al
         RwSexaylwVe9MjgOQgG6DzZ8lK0OHXOHUfgkZQEpnc0TxFaU9neCh0Xuq7ExX7DJpseA
         eRGZP/6cQEyCYEerGV+SCq+N4PYuqDG5LK3zPBqW2ZUbCcAMrLu7KABhPdpiSosycBhV
         ZmL1tRhEG5IHPLeZgjnTLfV5csR9oN9iJ6nDlaNoZfctGq2XlMR2YWq1vUYBG7roViX0
         XdnsaVfO6plN111T5ufjMDaUa2PXWNVdohN9HyS7dnJmuUupxfC27z44n3FGgRmw3dCD
         D3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786023935; x=1786628735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSeHeIOsrbYVt/cFGZ3Mudq1FYtZux95e0DZcHfkyoA=;
        b=ary4qO1ghIApjcz4qOQZaHyPm2RBccLp5i2cjeGbcGuVz7wIHqoLSc2HxjqVZmSdIT
         Iu+zpBDEKv6834MqL66VWzrpX4+qbscRuQ1a1EDctdCn7KOVGZUYsM7OP3+8NsNbDzoA
         9dbvqvOjEWqZD9bTmGCFrIhe1xDIDzikskkLNcbz5tvCjIxSlDaM5PZSaByaJ2Zs8FJe
         m/c9atQ/gsA8DdtlbZYuxv4uXOuPsiAE5bEVRjsopZI0jjxC1nFgGH4AAZWTHXyA2hVz
         AsT1ePpkF15TzWpnBC5Iz9zVBiqORMqqsjx9AN59ZgT8bQxMgBLLGbBHgDZVs+RDtzQv
         v/aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5rDXXFWZzaenWR7KufIR4chGOZQc214GAskDWZMKT4/iE1p46ly0WQTnC4Oub6HGMmY09DE+ZQeUBTzwYQuA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx4uGzqYNQ0fwxHLYOIACv3uWXjdWSyByj2KT6TjEtRZsG8RMn
	e/c5Mxjwy22Fylus1gb3iLzNu0kcBxFC8GrOzav32/9epfRQM+91gRKl3VqpXoALBBk1+8MNomD
	aBKHnunzDfWcYlaoOoyYldHtzca6Ar69PizDDz3e2
X-Gm-Gg: AR+sD12EZPjhmcq0Sv4lq4P13McXfvKHrYUvq6MbWOxWXnq4ehFVuaQ2Uceyn8AwHC0
	rntloNcbOqOQIXYKCQztjcDlkzucTdejEPmknzPZjan8maqWqBgGnTHPVd1v3L1nIQvjnZuPwny
	QJMxVP+Oq1GZsYE4jGPQBHwx1WAh4QA6tlFsJZR5uy2KmYdJxMWARn74F78fDGLaLLY/ivMuE76
	NPsEbCg5pAnRCNm78Aigsstr0ustwc6x6LkcSMiw4kBO4gAWl8FvPpDLFdFJ08c+Ja/UFXh9WNC
	E1q2YTIgoiMpM544uY4i5fJqYH+PYrLA9c7Rl2kW21b7La8tqG4OY0ILcSNqW563Uj/cPlsoL3x
	dRCfYkLY8RrC0BRkxniFFwHINSbwmRqtZMt5SKF44PigzBasat56WCTQ=
X-Received: by 2002:a05:620a:8c89:b0:92e:541e:632b with SMTP id
 af79cd13be357-93649056dc5mr1186003185a.2.1786023933857; Thu, 06 Aug 2026
 06:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730220055.2946171-1-tejasbirajdar@meta.com>
 <20260731220124.B0C621F00AC4@smtp.kernel.org> <1f36d5be-906a-4ba5-8679-24cbcf899254@redhat.com>
In-Reply-To: <1f36d5be-906a-4ba5-8679-24cbcf899254@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 6 Aug 2026 15:45:22 +0200
X-Gm-Features: AUfX_mwdvTEom7e3WZw1jtKlW4Jx4hI_DGQwZjfU5OQKTgLw-QKbrPG4mz7zWVg
Message-ID: <CANn89i+P6Y+uBSKa4S7CAqJWrZNqHOTKY2A2jaVs2iFG4_wRhA@mail.gmail.com>
Subject: Re: [PATCH net-next v3] tcp: honor BPF_SOCK_OPS_RWND_INIT on the
 active connect path
To: Paolo Abeni <pabeni@redhat.com>
Cc: Tejas Birajdar <tejasbirajdar@meta.com>, bpf@vger.kernel.org, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 11:15=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 8/1/26 12:01 AM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [Medium] The `SOCK_RCVBUF_LOCK` check executes before the BPF program=
 runs and before `full_space` is inflated, silently defeating BPF-requested=
 windows and bypassing dynamic `SO_RCVBUF` adjustments.
> > --
> >
> > --- Patch [1]: [PATCH net-next v3] tcp: honor BPF_SOCK_OPS_RWND_INIT on=
 the active connect path ---
> > commit 2cf5d1d17ae1c7488533ecaa0fcbb83ae4591ec8
> > Author: Tejas Birajdar <tejasbirajdar@meta.com>
> >
> > tcp: honor BPF_SOCK_OPS_RWND_INIT on the active connect path
> >
> > This commit updates tcp_connect_init() to honor the initial TCP receive
> > window requested by a BPF_SOCK_OPS_RWND_INIT program on the active conn=
ect
> > path. It inflates full_space if the program returns a non-zero window,
> > matching the listener path's behavior, and uses u64 arithmetic to preve=
nt
> > overflows.
> >
> > Link: https://lore.kernel.org/netdev/20260723214208.3655474-1-tejasbira=
jdar@meta.com/
> > Link: https://lore.kernel.org/netdev/20260722170033.2763794-1-tejasbira=
jdar@meta.com/
> >
> >> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> >> index d7c1444b5e304..fcaa04e65189b 100644
> >> --- a/net/ipv4/tcp_output.c
> >> +++ b/net/ipv4/tcp_output.c
> >
> > [ ... ]
> >
> >> @@ -4137,10 +4138,13 @@ static void tcp_connect_init(struct sock *sk)
> >>              WRITE_ONCE(tp->window_clamp, tcp_full_space(sk));
> >>
> >>      rcv_wnd =3D tcp_rwnd_init_bpf(sk);
> >> +    full_space =3D tcp_full_space(sk);
> >>      if (rcv_wnd =3D=3D 0)
> >>              rcv_wnd =3D dst_metric(dst, RTAX_INITRWND);
> >> +    else if (full_space < (u64)rcv_wnd * tp->advmss)
> >> +            full_space =3D min_t(u64, (u64)rcv_wnd * tp->advmss, INT_=
MAX);
> >
> > [Severity: Medium]
> > This is a pre-existing issue, but does the SOCK_RCVBUF_LOCK check happe=
ning
> > before the BPF program runs defeat the purpose of allowing BPF to adjus=
t
> > the receive window?
> >
> > If an application sets SO_RCVBUF prior to connect(), SOCK_RCVBUF_LOCK i=
s
> > set. In tcp_connect_init(), this caps tp->window_clamp to the old
> > tcp_full_space() before tcp_rwnd_init_bpf() is invoked.
> >
> > When the BPF program returns a large requested window and full_space is
> > inflated, tcp_select_initial_window() bounds space by
> > min(window_clamp, space).
> >
> > This caps it right back to the pre-BPF full_space and discards the BPF
> > request.
> >
> > Conversely, if the application did not set SO_RCVBUF but the BPF progra=
m
> > adjusts it dynamically (which sets SOCK_RCVBUF_LOCK),
>
> I read the above alike: 'a badly written bpf program could be
> ineffective'; not much relevant.
>
> This version LGTM; Eric do you have some comments?

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks.
