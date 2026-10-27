Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793140690;
	b=B2J/X5wPRmR6Ek3DgrVmXNclt+aPtgXwsE9Y+ZeyYFIZPCigqNMHz/quHOmGk5BgXzAv
	 /hAYLzxijkDwp90OJvP1azKuIfjoCIExwPRSndupc2Hofme+DjAKwMdsFXumyc+vggjN2
	 ts1R5goZ5UwICk2yORAYtLQzJsXN/IUyoHQUqVFseJw5w1hHpuIz/CV9+gNTwrJUS+OOw
	 EvrdhmHgggod0nhZWb2GDl+jGn+OUEMLwh9wuWVTNtxKviEV8iTyeNcsa6ZrrY5gpsKO+
	 GJaf26LRy4lrMBlJ1BaaB6vpY1h0rDDOItTIUtz6dafC6HK+TzU8OfLLZxKiOb4D1zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LdT6iD6U5pz67EOvdAAgYZ+lbXiGFcABMt5AzI2eT3U=;
	b=PajVusZrxLL4RMFqZV9cV0mZ0ax+En8J95y4FScrrp2XssCLPeCrblZC35pIUi6ZrlT4
	 vuUAb2puttT+TxVU7rbFayUc62cUyolw3rLUxumDwgUd+EAN1Qp/OIjZhQ5Z2G3u8zMMC
	 fvrmSQJL0iToEp1Yj8y+SQ/KJ0D6RCpLc/ywTSEh7cd9jDh87UOG36VHUrbVJiLyaA3b/
	 fKQBAU0646svd2/ASL3iFSLMuQqKA4gAl2Se0zsomfqnSkWo3sCAJH/svYIzEj57wrX0J
	 KgciHOR7uhudyv1IHIxoaGKOj2o3XjBnvY4Ikq8qY/9h36uinWGQunmwEGC8GzFMjig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=x6u.co;
	spf=pass smtp.mailfrom=x6u.co;
	dkim=pass header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=oKI5kJxa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332EE606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 22:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 332EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=x6u.co header.i=@x6u.co header.a=rsa-sha256 header.s=google header.b=oKI5kJxa
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so526044eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 15:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793140689; cv=none;
        d=google.com; s=arc-20260327;
        b=ZxwPImHsPFuKWyIlsFL+WAVms9OVdKOeBEe3SPSSqV8ZwnrLl7XEMejt/fU84IhMyg
         lzIJqqnQcmVFZny9uvIRCfSkKNggp9VSHqj8f2GFrAtWItIK+PjNn3a2TRtBAdUkabI9
         /lZdjqV9ZKnN1Wy+9HXDCmnWylBLiF9sLG8pTh088qnK70mpZ0R3FjnQVzoMXF/919js
         vJhZW4y3/EVxpWAGjPDB4BavhplVSjhO3htMH1nfANWObGTmXqcaOM9f/LL55yz+c5Iy
         DpF9ccl8uYHyJaOkqXXhtsvg/+pNZcRAoas1Ed8bBUM9bVs3Uku6731qU3Dzw96kvSUM
         mywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LdT6iD6U5pz67EOvdAAgYZ+lbXiGFcABMt5AzI2eT3U=;
        fh=VO08M64oCaUDeMBhgGaM6Q6pr45v9XVGTPY/b8I6Yxg=;
        b=ZpkHJ2IG/iQKCbSnFIXKHYYsM0v2SZljBRcnFKdcAAoN89urDPLbST1POd5N6bc24g
         UsfP4qcZvjxqICPkS4PuFjBgzg3RuptASRttjhWaY7GeM3DIJM1ViHTZ9HAkmgfw/VG2
         J6V/fsNwWX66akSPR3pnkJUCBXjzRLT1WITqE8SuDpEtmbs/xSknI8moEdbJqUOC6szm
         SYQfZLoEa3sNMo4txdJ8l3+wTquEJBte9IS/mDLBDCwTL/jN8TGbKxVsdLfVcajbIYNG
         ajDwe/twJwWEZ5tQq4Kq2xjYAC9f9GbhTiFkTykF8ix7oSfqcvzMa/IsMZ6c8ANwhiWT
         dcvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1793140689; x=1793745489; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LdT6iD6U5pz67EOvdAAgYZ+lbXiGFcABMt5AzI2eT3U=;
        b=oKI5kJxa4zlcKiAKKEs9Vy6lv/lzPeHceJkOhp7mtVM3VKhzJyByNwGloTWVrQlFcp
         Wv+m3OT/pjbX7rZuKtqdMtqza30znTZLND1qI4qltGF6gQd61SiFTy7ZHGDuVHLzJpSw
         4S1JQs5tuJIUbSHyTDSIoD4i/5PHQltyADYZHMP8poH+ELdsNSvKRg2E9qK3PzQUjZfT
         EiALKpj7dy3YF83dfLwo3r+1kDuCwGhDPC3fQZwgyaSbN/axVMUN3cWt27zUl/sM8QhV
         DUXrNUettpYL1PYPGHq7x9VlaB2iNATgOWBP2JoSwWtJ8a19HlECTWjcNUfT1PEc0H1e
         2c5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140689; x=1793745489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LdT6iD6U5pz67EOvdAAgYZ+lbXiGFcABMt5AzI2eT3U=;
        b=bNaeqYK+0Qr+qb8who/AUoay0y7Huo3sTO9pzZphs1FOjT9Zk0kLpkqrXx0Wctpcgz
         JOFFb7I7oywJBwcmOoo8BSxwiqMwOgL5eZQo343vZ1XaDBxFkOkFErpUsbVc57UUsC9G
         CL19mrZ1RsDlWcH2D508VklkWGyazzbx22pAUoVEkkBlR47BxbiPhtvh43PuNio79uge
         ZaoSu/Y01if1ZqhiHUZiHxZ4OqbQV4MbD4p3qbmXatj4G7jEhg4JAybWK3DO2VRUE6xb
         CvkMLo5iiWP6ea/dqLnV22O6XK5UuWYmv/sKY8Bidl0sjIj6IglskUF+IANvdUGcNNmt
         v0Eg==
X-Gm-Message-State: AFq9FYKXJm0EJdeeRrgH6xRZb6Enxt6j/w8FUmpjIxCUm02P5vn4dNjt
	PEQ/g4l25ZACdcii4G991WxA6ROPMo+pxDaXWubtG02ROJBlnwqL6wlkP00msOrXd49YxylWX39
	P+4/6MAet9yg3Ctu4FI3MkhM8EaOesBac6JXRterFWTM=
X-Gm-Gg: AYBFou3NE7xWm1oWwPQIW3WPaG0OcISSZLzymrfpf7S5C0DPbx6PgeHqWikQ98Hi6IQ
	V+wruUMjfgSfCyVShYgMh4KFGzIlgSYd+Ycv2aVFKouTIbU4loWmt7kBvzqvbF9Mgy+jRlamyoQ
	AnxT+fKuaCi+u3kCfqzko7nkH0OUoQJgcuRqKvXBLpW0NO0/Yn+c4bDtvDbsA9X0mU/tTEBB0mN
	EoKjKyrtA1TUUNBV2IdfWKZzbx+79JWKbxR3+TpMNsWP9PUpg7S8a9UTOLKk59uatOg5VAE+KSG
	hcPdorHWGtN4Ry9I7tVmk6lA2SEtMKrC0HhmhxxWa0xDapUHWqRfiDGnQfTVgtGXgbP6lFaY6AF
	//z5XPbn05qC7uCRZnC7jPAVA6TzW21BWpI7GuCMc168OCcw07Jut9zHibFS/3OTRaZv7DH79rO
	n9eUTxmHRxPzQ7jOs9yaRy9WA=
X-Received: by 2002:a05:693c:23c4:b0:36a:15c3:2aaa with SMTP id
 5a478bee46e88-36a200d82ccmr1623831eec.29.1793140689069; Tue, 27 Oct 2026
 15:38:09 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016202909.1289496-1-dhu@x6u.co> <20261016202909.1289496-4-dhu@x6u.co>
 <sashiko-outbox-174922@kernel.org> <CABdL-LTgFTwJPTD0vyScNsvCSAW_04TgOyO1swVBgHxDcmJsfg@mail.gmail.com>
 <CAHYDg1QGH=GwAB-acW_oj3DJdSZBPidv9Xxn+n9=RT9Ss2PC1Q@mail.gmail.com>
In-Reply-To: <CAHYDg1QGH=GwAB-acW_oj3DJdSZBPidv9Xxn+n9=RT9Ss2PC1Q@mail.gmail.com>
From: David Hu <dhu@x6u.co>
Date: Tue, 27 Oct 2026 18:37:56 -0400
X-Gm-Features: AclHuK-6lGzWX7nlhDFd22pf3urIRUeJsC9YK5ZEGM6BvwWD4uYQWxMpRmotH1Q
Message-ID: <CABdL-LQUdPaHu1tKW7fyXraBEUQBK-Xuv59e6u9_U7+AO7NivQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next v3 3/6] RDMA/irdma: Support UMEM attribute for
 QP creation
To: Jacob Moroni <jmoroni@google.com>
Cc: sashiko-reviews@lists.linux.dev, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 8:02=E2=80=AFAM Jacob Moroni <jmoroni@google.com> w=
rote:
>
> Hi David,
>
> Looks good in general, but since this IRDMA driver is used with iWARP
> NICs today,
> can you double check this Sashiko finding? Maybe this newer path can be r=
ejected
> for iWARP NIC types at first? Or if there's a way to make this new path w=
ork for
> iWARP, even better. I am not sure if there's some generic way to map the =
generic
> umem for CPU access that works even for dmabufs?

Hi Jacob,

Thank you for the feedback. I double-checked the Sashiko finding -
yes, we can make the rejection explicit. I'll send out a v4 shortly.

re: Making the path work for dma-buf + iWARP.  This seems doable; it
just requires moderate work to plumb iWARP specific quirks to be
dma-buf aware. However, I wasn't able to find a compelling real-world
use case for this. If there is a strong preference to pursue this as
part of this series, please let me know.

re: Map the generic umem.  Yes - I think such a capability would make
things easier here - maybe something like  `ib_umem_vmap` (not present
today) ->  branch off based on `is_dmabuf` and `dma_buf_vmap`.

>
> Also, could you provide a bit of detail on how this new design ensures fo=
rward
> and backward compatibility across new rdma-core, old kernel, iWARP vs RoC=
Ev2
> modes, etc.?

re:  Compatibility. The only two cases of interest are:
(old kernel,   new rdma-core):  ioctl parsing tree wouldn't be
registered; ib core dispatch would fall back to `write()`, and it
would work as before since ib_udata is populated by ib core.
(new kernel,   old rdma-core):  new kernel irdma perform
`uverbs_attr_is_valid` checks and branch off to old handler logic.

re: iWARP vs. RoCEv2
This series preserves prior behavior while adding support mainly for
DMA-BUF heap-based queues, for RoCEv2 use cases.
VA-based iWARP continue to behave as before.
This series introduces the possibility of dma-buf in iWARP mode. It is
not tested however.  Rejecting DMA-BUF + iWARP would be a reasonable
choice unless there is a clear use case.

>
> Thanks,
> Jake
