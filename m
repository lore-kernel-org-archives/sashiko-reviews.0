Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599304AB1A5
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052045; cv=pass; b=ftbh2L8N548NXzKCneyOciSpYOHx16rxBoe/AX/MgJhdnb1i58RIj4bIp8QnEBVcjmgpTpjmBCh7wJtrl6bsTl3rSzGN0ybJQKiwP4kn05Pp2fiIlAIYjPNvkrNlgESAZnnuAWvaEfsJFZkXB29iE7i+N9UkrOdUw1KHGAeFtd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052045; c=relaxed/simple;
	bh=8iAiwpwW47OVOJnhscj/GgCmChXaZGHipRfTymOcxfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mo59g6Qd/A2X+73WigV5mXM9xYuFBXme0IacvpuXxTJsLM+mkrYMyIkzm4mca4jCsX0PbX7ALb0InkR25l4CZtNIRslZNYTeQ8K9hg1+WmFN/DaMMpHo1OwtcJGn9LMGWUnVuilxuPekWTeH9II/utjUHUUzkSFOnf1vhKcCkmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=Z+giYQ+h; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="Z+giYQ+h"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e82462a3f1so10359145ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 01:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792052044; cv=none;
        d=google.com; s=arc-20260327;
        b=I+TeqBCtsMKtUQ6pp7gSb2JUngvjONm0NLdWtGQMFdPkTRTzE0voy5W401KBIhdo2N
         wTwvV9qCN7BeBbDSk5C52ZuT0xikSJ/COEODQ7aZrCn0KXz75ycfJj/D2heMGqDaJ7XH
         oEbxiP36Tw+0uAaAcH4K2gIYS7Soz5dxe9DVPTxRb8qt5Rx4/v8RlDyWPb9B2rU5+iMX
         PSnckGvvL6Nm1IkD7Vc184JoWt5FtJ1HBqHYX1MaCpTz5rwYpI1cI6rSORSDz9Oi/Hii
         7IiseIArINE02B97f13RcdVSWuN61fkvE7GFA9F4uIAEdZH0k1uhvB7sVtc5+TCwnwrm
         tDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/xXmvRy3j+cmgGMPixggwBzzW8lSFiwFQMa8Y9E1dK4=;
        fh=uHiD7ktNrqpGN5zfAejHhNP/veQBf8QwA/4Xn3G8QTU=;
        b=e6YETjtI0O/0+tgXW7aO6hekTfI9YyrcSlD9Wn8ZNZP/gRNvxglgya5N5uJN2PmFtd
         IdgN3iKcgYj5OOMRcdYKrZjc+8JQvbUCJxOoBA+ekhs2g+WSTN74xHWGSQeitE2IsvWP
         O002sIbeQjEIajL8nfn6/KGgDfLm8mr3yYSp4zwg9NNF9FpPXKyx5yYU5So3pIqwGzRN
         OJdOBIXY4W/ZInwtAIjGdJGQ5GbKzvisSCdWadK3PoiHCHzD/kanONBa4MQU7c0K2i4n
         m3gZwOxJVC5T/bGn7kWNs3iGK5MwRjYowuVZdjQnfryFKWnrBuxcPdfZ+nUYa0OptO74
         Gnzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1792052044; x=1792656844; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xXmvRy3j+cmgGMPixggwBzzW8lSFiwFQMa8Y9E1dK4=;
        b=Z+giYQ+h+dQl/g65XSsS8LaS+wUAU9DSk4e+xDWZDP5r+2zxVzzKvR9MbwfIbDl3I5
         xVW9IcNee71w/+gB4Lm/Tm8fqa8XhsJiEFy7qQ9S3HVMuXisRFM3aSwr9+lldzyRpLDf
         T+IBWGBbR/92a3c6yHjq3nxzctFy+hquAFAxvzq2eHmGOyAg84a4Aeplw3Ip5/77oQxM
         vw+BQYhoguj9tFY4tX35S9U8cHi8Bc8+B+iCF2OqVSTnVW2nY/NVEliSRX9pEk76TDvZ
         dSTTKnuifCzsyoxznQl/8jesjs5B3/UDeEE3OSUYc7YDcH4cxjzn4O6gO9KhGkIlbgUc
         pG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052044; x=1792656844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xXmvRy3j+cmgGMPixggwBzzW8lSFiwFQMa8Y9E1dK4=;
        b=hTLtHYZmbqr22kQWSOIUxTzMmcq39LAaQRoRc3XIf6gXUHpbqeDIhG5Bea7imLoEuN
         kLzwyfRF5w2HZ1SenSP5x9NX2IoZZgLVKKB9x5OtqdK4npVt2iIwcHV0IEq6fHibZvs0
         lkevcXBzJmdjfCykubj1Q5VFOXREI20urQPHBFfFhEUZ7mzjZgi+dOcvx5hi5gBi7DiU
         uDNg0Jv91HWuhjIhfORsBbG0LR02S47dUbETVpq87ze0vKmrPHuymPiGgxOF2etstyf6
         OX32qhC0FFic0LH20ryx+C8CjDSrOfPCQ/OC9/v5+EzzRNr0VTMONl8sVWb6wilqqan/
         HQIg==
X-Gm-Message-State: AFq9FYKUIbooVQLlbVkXtKWCV7ArlRjSOhsO0TnOmdtMvksKNR+edCu+
	FlF856fShtVFtAFAvLIKgmSngKYEpSjzy5LUtjnnwwFOTrQKP+LRevyb5RyhAFIih2AKBmxnAAr
	x5yMkY/KDmtny8WhOfENLwEVG6V6DBF8+x/ky4dW0rGITTb1n6JdltozyLAKT2HgWhc0=
X-Gm-Gg: AYBFou2b5k+VIMiQFOWh1Y7AQl+GrPOohVZh02ujV+8I2izxITJqFuO1a4+UsL4qtbk
	L6bqyu+uhtlSWDwOpwtf6us1NBlLlpIkaV/W+jg6ARxN8agtVmG9toJB5cfxz3FzGkKdws7/xOe
	HM1jc1fxWJlolym5/gXQNgyHZsuD2zQQOckL/3c2oOHelFSdhW1GqNHCE59pSh5NeVF9vjqlwt7
	CUrqKKFu/+Qg9mGncekIOg1cb8eQwyKG13i1DSO4N7MDSfBT2m4wHfb4aTboPc1KBXZc22570u+
	nJdz/hr8ZWlM0txN8pYwQ9jNzWsIiR/+YgvroSl09eYCVilnwIvB9jx6HgCga11sHTt2UYrAo+I
	LJ7VowKI6/mA=
X-Received: by 2002:a17:902:ef07:b0:2e9:3395:cca8 with SMTP id
 d9443c01a7336-2e93395d1c7mr45816975ad.46.1792052043589; Thu, 15 Oct 2026
 01:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1792048855.git.zihanx@nebusec.ai> <1eca65f844ea4eaefa9ea4a852f1db27aacc10b9.1792048855.git.zihanx@nebusec.ai>
 <sashiko-outbox-172439@kernel.org>
In-Reply-To: <sashiko-outbox-172439@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Thu, 15 Oct 2026 16:13:48 +0800
X-Gm-Features: AclHuK-Od2hWn9HWhQZkM0X9wiI-VanPEIsuQFAjFuP9aKbDkjFi0zgaRUsjr9g
Message-ID: <CAANe3eTJcfGU8DcbrTLtOwM8tcDx5TkUrZDXXnUbT70m7X3+1Q@mail.gmail.com>
Subject: Re: [PATCH nf v8 1/3] netfilter: nf_dup: preserve guard across
 NFQUEUE reinjection
To: sashiko-reviews@lists.linux.dev
Cc: virtualization@lists.linux.dev, intel-wired-lan@lists.osuosl.org, 
	bpf@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, Eugenio Perez <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] netfilter: nf_queue synchronous bypass triggers false DEBUG_NET_=
WARN_ONCE
> --
>
> commit 6ab1ebe7cd71aef0c99fc87d28ca2657ffc20779
> Author: Zihan Xi <zihanx@nebusec.ai>
>
> netfilter: nf_dup: preserve guard across NFQUEUE reinjection
>
> This commit saves the task-local in_nf_duplicate guard into struct
> nf_queue_entry when queuing a packet and restores it during reinjection. =
It
> also adds a warning in nf_reinject() to ensure it is not called with the
> guard already set.
>
> > diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_=
queue.c
> > index 477fc632657f4..1ec9c1fbae843 100644
> > --- a/net/netfilter/nfnetlink_queue.c
> > +++ b/net/netfilter/nfnetlink_queue.c
> [ ... ]
> > @@ -369,17 +370,24 @@ static void nf_reinject(struct nf_queue_entry *en=
try, unsigned int verdict)
> >       unsigned int i;
> >       int err;
> >       u8 pf;
> > +     bool old_in_nf_duplicate;
> > +
> > +     DEBUG_NET_WARN_ONCE(current->in_nf_duplicate,
> > +                         "%s called with duplication guard set", __fun=
c__);
>
> [Severity: High]
> Does this warning falsely trigger when a packet is synchronously reinject=
ed
> during queue bypass?
>
> When an NFQUEUE rule is configured with queue-bypass (fail-open), packets
> are synchronously reinjected if the netlink queue is full. This synchrono=
us
> reinjection path (nfqnl_enqueue_packet() -> nfqnl_reinject() ->
> nf_reinject()) executes in the same task context as the original hook
> traversal.
>
> If the packet was originally duplicated via xt_TEE or nft_dup,
> current->in_nf_duplicate will already be true.
>
> Because this can be triggered by remote traffic intentionally filling a
> bypass-enabled queue with duplicated packets, could this introduce a remo=
tely
> triggerable regression on systems with panic_on_warn enabled?
>
> > +     local_bh_disable();
> > +     old_in_nf_duplicate =3D current->in_nf_duplicate;
> >
> >       net =3D entry->state.net;
> >       pf =3D entry->state.pf;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792048855.=
git.zihanx@nebusec.ai?part=3D1

Thanks for catching this. The warning can fire on synchronous NFQUEUE
fail-open reinjection, where both guard values
are set. I=E2=80=99ve narrowed the local check to warn only if the
current-task guard is set but the queue entry did not
record it. I=E2=80=99ll test the queue-full fail-open path before sending a=
n
updated series.
