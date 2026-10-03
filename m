Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D4A328B7F
	for <sashiko-reviews@lists.linux.dev>; Sat,  3 Oct 2026 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.229
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791071653; cv=pass; b=AcEtAfmGE5FKhcKUWJUwSJwapg2wCUM4+LVMywOkpcMggS+cdjimmSMeTfKldHuEWphaa5dc0+bBNFFbxGL8y2JQ/oFA7+1ThUhrTEKTXLgKhMDzWljmG8ju+bgZ2HYtYy6Gib4JA9a4uW7NCgTYd/IJO5ExHRbuSqyfos89sCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791071653; c=relaxed/simple;
	bh=tLQXED6TnpPW56Dh+KHvxT+XAjreuYSqEVzU3htBIms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iK0KYGRm1Kxf9p0VVAAk3AxJ5xbSENxGZfqp3psbJRoGs1wUwH+9f4TuR6QM/ltf/8+GsmjDx8yHAcE1RexgYB10ogZOvI0Ut70PovlyMegsFdMsY917R7pNXp4sY27Euol+1ff4JuJK5BWeWx6QfD/vhsYrrS9jF/jPtdzJj/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2TH249c; arc=pass smtp.client-ip=74.125.230.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2TH249c"
Received: by mail-qk2-f37.google.com with SMTP id af79cd13be357-93e587358e0so88630085a.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 03 Oct 2026 16:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791071650; cv=none;
        d=google.com; s=arc-20260327;
        b=OqHkL7iwea9ibceHKYRitJ8qVHRV+X02nP8Webjq9Q4sPpq5bkVF+ClHBsl3ri1yiQ
         8SHwYSbu43Jp8QlzWev3CMKAuAJP6pVTRX2YlM0W/wyBz+qAmXXJmdSqTJ1TBE3VcuHg
         q37+RNkG8m3QVVVW0xJfa29aRZoFXkOzrfPY5cUtP0tbMgGzRYzsNrWk8GrMsZE6TJiI
         /QrcadkwMyBWRVTbmO5n8To8nyfmv0I75ZwS60M1L8IsuyerDm3wO/GdvOPjfAaQZUSM
         suuHoQ73ZrgMXlTxv9tAfR0ti5kXdHRhCdpjnw6qwdfESkmL3qi5dTMUcfURDLQEZy2l
         bb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mfJzD8Nrn5OBEx9DAMeICCEetrQp74ti+65lMtrTctk=;
        fh=MkNNWmR18b3t4BZAqPlpZ2EfxgqWNAPqgdhOEe4Su/k=;
        b=UOT9w7ggOG3sLR4wVwRZ2kq66Ijp2n+hNP9eFZ+N0Cs7dAtsVVKTzzbGu+zF18wlUK
         BYh/eobeJ3O+LJ1YukOKoIfG3KRsIjVHkunpYSXAq2+/w68ioetDiqOvKMOLWn1qM0cf
         g7KCO/XlZ4qx1oLDm465YiRowejojdcnmoD9D6Ku6eD/1YQBmlZnYyCWcgt2SdqWj4an
         DeZq5F48+BxuB6eZnH3QHLyFUFghPGK8TRoO8bJnDUTTFVJCAJuGZ5AR/erINSKq0b9W
         WCao398nKnXA9J6R+MAtE7M/Z53L7qhlHcfWUoARiQ+KZ96bnxaCytc61Np0HB7iADnz
         XJcg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791071650; x=1791676450; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfJzD8Nrn5OBEx9DAMeICCEetrQp74ti+65lMtrTctk=;
        b=M2TH249cN7cKaG28ibZ5SpCCTUKILB/fkUwLlGytz6e2TGBmoYD0ViRSJAUQa/1v9j
         md2FSFXfbMRV2/6QwZ9Bpd5YyvzN2XFmt+dZgpenz4tFza+e9IvLDYGahyV4C4XlG9xx
         sY5xE+/vnuSYGt55hPZCPrqJ3vm3qUe/5kQIPjiBIlgXkos5rJjTpCn5mEBtub3IvtwX
         weF/I/5kb5qt+shCBzqy/RNnIuhdyEWxPIxXXXZImBIkzMmoWe6fdzcyhbz+RxWvayLz
         UneXoJYVvmDnAIFdEu8MnwfZWeeFKHBqEGWX2FuvqY3FjqO9dluDB4gFEVLkUEFcFZVu
         NbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791071650; x=1791676450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfJzD8Nrn5OBEx9DAMeICCEetrQp74ti+65lMtrTctk=;
        b=R4kUnBr4f0HDkCOry9pZ1qkG/G5FNUht6n1rTiVnSSO4p8svw2iu0oRbZQif3u9MsB
         LfrkJJYI01/vg9uVHl7qenlRATKQseHTdkiDneNfrEwfnYAi7marz7DpBxFmjsoz0aDn
         89OSSpfdgOuQAM+fEWL4oLBdU1dmoFtn5KBBCeB6+6S2N0bMcynjlhz/v90iWEWQbE09
         HAeAd8Fg5rm1ksTcGcBKG22GWBpDNcakM3U4WtTDTsRX7bOABTyO+20o0HQNLCG1hiQF
         Y2BgCkUopSO9tvjvUzi3X8EcDGmhSPg7Ucjyotqle5hi/2+UezU7OPdeqqURcfgiizJ7
         heYA==
X-Gm-Message-State: AFuF++nQw9y3Bbd5DFWRauZymmuSkGcX0yO6+qkk6B1WV69Nm9ipLd5/
	8DraHTj2a+8aK+tlhj9ZsskZDtFR7LvD0WXhZtiyFb3JBQJjw1yfB8qDWUjk2q4xKd8F7pPT6FL
	f/w5vI89Lvd2mmX9WhEw9osFfQfWtOL6FJU6FxXs=
X-Gm-Gg: AYBFou3WzD24tDpWKwj4CxWHH+aHZA6YkHfH2CWl8L8ruhbPzkyyAi3HvJnrqagiaBX
	l8qJdu81zM47KYdZBCxLWPYLVQHN7x/j6DAJDydWNxHHJVon2z+9SkmH2clz6VFH13XY2vAefyV
	KEEpvTsFm+MuKy0oeUXOQqKIlIVxcS5YPbHSeok5p/oQ3ZBfYEFdQBVWO0piRWiYyIAf8w78+we
	4WqYqdNEJDZjRszdHT0mIylK89zuIYMnZsGxKpH13igZemIB3wl2enxfoi5lBjDTXzeGeaDd8GS
	6IiFFmMP4aAEWncmMuntJ2vtpkWj9XtPLU/t1adoUD89eU68XxU4COQ=
X-Received: by 2002:a05:620a:608c:b0:93e:4d60:d389 with SMTP id
 af79cd13be357-93e4d60d772mr857459885a.25.1791071650174; Sat, 03 Oct 2026
 16:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261002074551.318789-6-physicalmtea@gmail.com> <20261003074657.71AC91F0089C@smtp.kernel.org>
In-Reply-To: <20261003074657.71AC91F0089C@smtp.kernel.org>
From: Jia Jia <physicalmtea@gmail.com>
Date: Sun, 4 Oct 2026 07:53:34 +0800
X-Gm-Features: AclHuK9yiZzs7l16_RtJMlKQwOPOXk2Ehni0GrB9F0m8WE6NLxHkqNqpNjLmApI
Message-ID: <CAJwVaMLBRYhoZ9krgTt5X2e__AYXMtyJQhW_DEQ8_zqCM7WxZg@mail.gmail.com>
Subject: Re: [PATCH 5/5] vsock: defer RX readable notifications until batch unlock
To: sashiko-reviews@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Eugenio Perez <eperezma@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] vsock: unreachable callback replacement abort logic in batching
> --
>
> commit 811453fb266663fdded1db37d3b4cf3bde547c9f
> Author: Jia Jia <physicalmtea@gmail.com>
>
> vsock: defer RX readable notifications until batch unlock
>
> This commit defers vsock RX data-ready notifications until the batch fini=
shes
> and releases the socket lock. It records the initial callback to handle
> mid-batch replacements.
>
> > diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/vi=
rtio_transport_common.c
> > --- a/net/vmw_vsock/virtio_transport_common.c
> > +++ b/net/vmw_vsock/virtio_transport_common.c
>
> [ ... ]
>
> > @@ -2015,6 +2040,13 @@ void virtio_transport_recv_pkt_batch(struct virt=
io_transport *t,
> >                   vsock_addr_equals_addr(&batch->dst, &dst) &&
> >                   virtio_transport_recv_pkt_batchable(t, batch->sk)) {
> >                       sk =3D batch->sk;
> > +                     defer_data_ready =3D READ_ONCE(sk->sk_data_ready)=
 =3D=3D
> > +                                        vsock_sk(sk)->default_data_rea=
dy;
> > +                     if (batch->data_ready_pending && !defer_data_read=
y) {
> > +                             virtio_transport_rx_batch_finish(batch);
> > +                             goto lookup;
> > +                     }
> > +
>
> [Severity: Low]
> Can this branch ever execute?
>

Unless I'm mistaken, this branch can actually be reached.

> The condition checks if a custom callback was installed (!defer_data_read=
y)
> while a default notification is already pending.
>
> Since custom callback attachments (such as BPF sockmap insertion) require
> acquiring the exact same socket lock, and the lock is held continuously w=
hile
> the batch is active, is it possible for the callback to change from defau=
lt
> to custom mid-batch?
>
> Could this bailout branch be unreachable dead code due to the structural =
mutual
> exclusion provided by the socket lock?
>

The premise that sockmap updates always take lock_sock(sk) applies only to
the syscall path. When a BPF program calls bpf_map_update_elem(), for examp=
le
from SK_LOOKUP or BPF_TRACE_ITER, sock_map_update_elem() takes
bh_lock_sock(sk),

The batch reuse path checks sk->sk_prot in
virtio_transport_recv_pkt_batchable() before reading sk->sk_data_ready. A
concurrent BPF update can replace both callbacks between those reads while
the RX worker owns the socket.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002074551.31=
8789-1-physicalmtea@gmail.com?part=3D5
