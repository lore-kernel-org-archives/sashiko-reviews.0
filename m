Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1C446984A
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 23:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540828; cv=pass; b=jSlJ7jkkYkv18YVjfn99UOIAjJLwNvbEXIRk2C+6Mm0lOxKWMEzbgBowbdlw1GsHnxC6YkaVGk4usxruV8u6KIv3EOVHBRb6cWXRx+my1ni1rTum+f3AaRZD6VDWSgXZbXNmA9O6qVGunWDLUagqTM4+X3VKZBjXhbNKBj6R464=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540828; c=relaxed/simple;
	bh=PCuIEFZHs5AXmNvLyQaqmYzpNXqhYUhQFpW966jhkyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1mBy5LP1ViP2szyl6W7w9yU4KJHzIJWf2Yzdm7OWvo6Ee2x1X6ckR3q0hUOZG0Xz5vJYzBx5vbA1cwZ+chRx2tuXwdc1APkIAvq8vr86ENAw0yHZNylKVgKwpjRfz8tC/mxuvhfC8tGTQ1nZJP2AcRk7vhtP2lcwSkb7so2Wmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vAsE8+qu; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vAsE8+qu"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1482261a91.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 16:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785540826; cv=none;
        d=google.com; s=arc-20260327;
        b=ppuRlwEoxtr53jJX3u5/+eacshySreqVkrvw8KJB/TKQtYyiaVJi8WvLnI95Qc5tRv
         dS6WyMRDqh9xoawe7BJf5ZmfVcIS8ag6G/s8Pjuk24iyPCCUCc/42lu8xAutZhyLUWlL
         QwG2frLwvBDM8T9cfbkDXh0wWO3MwgLbij4YCXEgxUuJjHKwGZQAZlkGdS2raKh/O8Z8
         ol5038KeRXd43NrNvTU6ZovfnG4t78+Nio+ki+/tIwgc33nhWetOmn5UR9259/tpWuYa
         8uiCpHT0azLmmFBE2k8Asa7b3wi1ua0/axQg63TpcYsdohy4j2l7zWudpbbL+AWqPr1R
         /+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fQChzJnXEh8H8MFp0Q6rzCz9bRltM04lPn2tQfKFQFo=;
        fh=eAGK9bGdDG/mhUK8/2nnjo4jellwu03O0T6K4v/MWGw=;
        b=S2i7flONpXhi4KB/Kt1wySb05hfGJeyQRfKYCtOPa7owvwtMvTq7wDoqqDey2chEG8
         Y13cVSD+FIKq3leoYF5WnzuIBqe5LHNZwrU9xGqTdlo03t7HLQh3Swn8TN5q8B/OVYVj
         QZvOPfZKB3bmtKL6GgbmBjNRdMMBbu2kWWrt5JB7IhF7DJ8f+9ijyRLjvd1vquSrT+LJ
         W+QqjjcbT4pmBYRqmh16+2TPhyMADVlpSmJm6T/VNEGRpV36wOv/hCRhJYZcQDleBWJQ
         knQoMPt1hUDDEYJAXB3uO9hnnDpUC/XFFtZg8yLOdxMb9W1P3JL4gEea9GyfordhE7lu
         cR3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785540826; x=1786145626; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fQChzJnXEh8H8MFp0Q6rzCz9bRltM04lPn2tQfKFQFo=;
        b=vAsE8+quiifZPe1yC1P+SG+XDFTMVeacRen/e+dOgykO/+azY+VzgEY3GyHrZ+xTZV
         ZsvOIHXrIadqExm8RCsEF+4L/17TbnynU5C/5riBPu9//64Fc9GmOvzd+4T7AgZuzFjR
         fqhTqVuuLilAYlpiHRZAZcKpCqG2pYvNAqOJkmRIcEPs0QAMplJM9+17S522ZFTC074f
         ulF99dulFz1ousaSJYfQ3SB1bnQ8gzI9blryEr4FqbMUYodLROicQqjQ8zJpdo3P8RLz
         PcF0Bu9Qoj4F+XXKJ7XVwJI35E3usz80622wqZiTd2aLL9VoAsreY4/e1clbjLBK3Cr2
         FreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785540826; x=1786145626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQChzJnXEh8H8MFp0Q6rzCz9bRltM04lPn2tQfKFQFo=;
        b=hRJOoGSi6xZAQGxgTrSBPiUaCxrFHlxwidq+JgDuX5CRvu1eWsqhKEo8nea6N5Ycs4
         BrZLrGNmSqWArJrWVpT/l2Ek6dCmBzW3xWGc/vNc3DD1uVRPrU2n1rw8tSk1XVmNNlpH
         Q0StcFAigYXHeeHR+7iB3FaV96ce3pq1D7LVbsWHvegnUAwmoqjFDPUzPQeWVA73GlTN
         n8JgoyDF20HmxxnfRCRZ+KUUICK1mivI2DY3tdMidI/qo7BHi7Hj4oYcFu74IKfbhw/C
         IjUVZsAUkVNkXkIqob51iq/oBfEbf90uSvul7rLv4i+eFC2lLcJT3pCGnLGRRTCDuJB4
         5A4w==
X-Gm-Message-State: AOJu0YzG5FqpgP25fCxVLMvkiTvW5tVOTVmtzZHmuqVqgtdIfZRKAAfF
	PEkgx9He7J4hFZOVAW+LMt4K8U1HWvXyOwUTyOAobqolBG9g6JSW8SsQU4tT7fZc0Bwro3qUvpd
	YmLBVjQP2oHava2vUQ+OmG0axxbVvJj+rWEhd0pUBE5Jj+B4y5+yS3qjY+mMklg==
X-Gm-Gg: AR+sD10o0kJu+jM97LFCH9PCrvMMcV8i3Dl8XcVg8xXOKqkIaoh6mwpccZSLi+bLwwi
	Mg3mI1A78CeaYkj7B+olg0VmG0mgW3VnmXopF/6kVWV+Zsgv0NjraD0Kkpw3WtjRs//Ku/a5Xrx
	eahbLTw6++LrVWb+zFJ9WLfme0sksUKn5UV1en9uPCaXDUvfACCwnWcB2gb5H99eP9Oxgkn95+v
	lJD1UGNFtCk6b37LZHwCnSQ4FDk98W23a1m27nhVPf3ekCwxa7eNZyqHbTyBo7crHRZa4fXeaEO
	Ipjayd8vBSOhCNC9GKjNqlmSWZ7ucDCvpLIu7OKrF4dd6hBIpklCsJUL8qgFUMGT+BdodT3BohX
	JurdORacswCosg72j0NvRmyzNvzuzeN2rZK2OpBF8D0gnZlqXCpkKXCqxr3F7IcjnrHgTSRakBG
	0RdsLi/XeVZTlCUw==
X-Received: by 2002:a17:90b:510e:b0:38e:a555:8fc3 with SMTP id
 98e67ed59e1d1-38fbc5c04e3mr1443221a91.41.1785540825522; Fri, 31 Jul 2026
 16:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731231755.2474376-1-kuniyu@google.com> <20260731233136.A908F1F00AC4@smtp.kernel.org>
In-Reply-To: <20260731233136.A908F1F00AC4@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 1 Aug 2026 01:33:33 +0200
X-Gm-Features: AUfX_mwSp6UhBMcMTmJknHmFLku5OaIRrv5x6VVlXn_a1Iq8USG1cW9wm6dIgWc
Message-ID: <CAAVpQUD31xYKAx6NKdbqGKCLzk2ckB8Fb5tLySK7dBO_jvg4dg@mail.gmail.com>
Subject: Re: [PATCH RESEND v1] vxcan: Support per-netns device unregistration.
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Vincent Mailhol <mailhol@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 4:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch calls a non-existent function `unregister_netdevice_que=
ue_net()`, causing a build failure.

Hmm.. weird.  I saw can-next has this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git/comm=
it/?id=3D71ac90cca6d8e6fcdd674a50157181ef4ac441a0


> --
>
> --- Patch [1]: [PATCH RESEND v1] vxcan: Support per-netns device unregist=
ration. ---
> commit aa743c4ffeab7ce1e07d36aa7e401187541f6f4f
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> vxcan: Support per-netns device unregistration.
>
> This commit modifies vxcan_dellink() to support concurrent per-netns devi=
ce
> unregistration by using xchg() to ensure each device is queued for
> destruction only once. It drops the synchronous RTNL assumption for delet=
ing
> both the local and peer devices.
>
> > diff --git a/drivers/net/can/vxcan.c b/drivers/net/can/vxcan.c
> > index e882250180ef6..b7efed1226d88 100644
> > --- a/drivers/net/can/vxcan.c
> > +++ b/drivers/net/can/vxcan.c
> [ ... ]
> > @@ -281,24 +284,25 @@ static int vxcan_newlink(struct net_device *dev,
> >
> >  static void vxcan_dellink(struct net_device *dev, struct list_head *he=
ad)
> >  {
> [ ... ]
> > -     if (peer) {
> > -             priv =3D netdev_priv(peer);
> > -             RCU_INIT_POINTER(priv->peer, NULL);
> > -             unregister_netdevice_queue(peer, head);
> > -     }
> > +     priv =3D netdev_priv(peer);
> > +     dev =3D unrcu_pointer(xchg(&priv->peer, NULL));
> > +     if (dev)
> > +             unregister_netdevice_queue_net(dev_net(dev), peer, head);
>
> [Severity: Low]
> Does unregister_netdevice_queue_net() exist in the source tree? It appear=
s
> this will cause a build failure due to an undefined function reference wh=
en
> the driver is compiled.
>
> > +
> > +     netdev_put(peer, peer_tracker);
> > +     netdev_put(dev, &priv->peer_tracker);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731231755.24=
74376-1-kuniyu@google.com?part=3D1
