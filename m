Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D373AAF49
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565769; cv=none; b=i6EiJnxX1RJUVLAJmfiwM9ezV4yw47H9fx4oYZ4WUKWjva2RgQRZocL147uK3En7zMaBJ5rKiItW8m8yWWnynLQYnftyrWsJx1d7szFaci19PIvbPwX60kfmrhAkHmFI/UBJbanBQIMZkrvKNkLznQUYquDP+cWWeUsQ1ic6lvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565769; c=relaxed/simple;
	bh=GVtzPRUY+3WdouU0FCerpegVSH2w3tn1p6Ikj/AEcQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIZ3SdbvYLY88x5nOfklDdt4YFS/BCMLg7Itjy3D32DAvpZEb5bD5i5snj6jvVTNu9ypfe92chE4pz2EngAnAWuuyVK0fxoVVzgAYFNh7mZsHjHbzAnt8HNc1dNmPMHPaXBvQyVy5Bw47gYi+10QcVrD8dfFVP3rKF16NJ1Y5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpJfVRQH; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpJfVRQH"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so1471422eaf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 16:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788565767; x=1789170567; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M4TJX16AB7oF5KfuSUINVhcqYMne4i5NBIkYyRe0xMc=;
        b=bpJfVRQH/DUzlC+c+GWXi1doJ2I5h2O2p5BnxUS0qlA43aHNFuNglZ1Shq50X/svS/
         YL2y69ZjpPIgRSXRib+ekcQ+yoJTo/piM0mdLY+apWV4Iy6ga3RN4GxhZZjr9UaqWN+/
         9OOrKlwX0at3zOS65o+G+Z9nVxEYLPvKNzovw7q4/GY2l6DJGckRj3ehyLDjgx8SCnvF
         TqbBQrdAwXpe9r+auA94W5BWJTtjpp3e8FosBLz6N6140jIxS3jUd2q4BJ0MiOFeNjLR
         Ihwz/k8ocBDaBmVhcQYPLhzjlKiOL2t3iIzAlrXKMWoyD1JZGcdMWb5AyeDZWXH204cF
         lBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565767; x=1789170567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4TJX16AB7oF5KfuSUINVhcqYMne4i5NBIkYyRe0xMc=;
        b=NaPjFrGwnXvXV7xeQ+x3y10Hzn6EMw6sZM5Kk43obwUfgkXDKq7KkNQGSoP7/IVCKu
         KI4PqOABEPZVrda7J3G7BLgFisDy3qAZbO/x/f85e3zpl3ClmlnviuBuUIjTIWK0I6Ce
         6KpdBrDIbVmQwlTdZ4WMY+aqAxvHVeExkomfwDVcyaev82099CV6PnxfkjyUQbkyI139
         7ZR/hJKvrM3caYRcAP7RdvlEDlUgqezzNnxgDKePITyJS/3dZLO7l2P9eTe5GHQIgGNg
         rvUIf8vuFIRabgol//Mm+1Wmk8639NxvhMeI70wIKShdq2Zn8pGP5RlkH/cycHoNIm2f
         oy5w==
X-Gm-Message-State: AFuF++mB59X/IVXK5+MdaGqBsOTClb2od2WuddrlFTzGMsUnbLZ2Kk4O
	ZerEKXm4LtEnxqZQsrkCSyfHs51uN7ntj8Ayihto1Pxhc2zPQxmlIuPj3YL2UA==
X-Gm-Gg: AYBFou1pn7lqi+DmhLA9jH0qp7pT3AF7V0/b5RApZoj9WT/WBKFv2kQwUS8fzPWrPIk
	1jAUDkjrwwxcFsEhq62Fxjb4nVfOhUhYnimj/NlJXzH9mPhpQTkBWhgHS1eEksLQkotMHm5xNjm
	PGXUhBXAC6Mt4Af6bmfdFzpFFWwtOJ8iNt7lfxW4kMXDIbiYlkIISz0QLqDbyoJW4XyMVJ++Ffa
	lxHxHTNKo8b4/b5txijKGQKNoTghpMUyDV9tIgX+BjjNGXta9YggVo5fc4ZgDVcEF2M40Wg1yyX
	f0UOZ7/1PoRpmKDakHTt9illgQqxEWk1CWMNWlYZpwdAZxZhlK4Epaxf80p/OXXWC1HXXIOPm1k
	j44rv80E9HK646kI5zU/1k/LyGHEiL75tsFq4nTGyMiPR17lk9ec7i2aB8GxTjMmpyE1jDHTLfU
	0H9ppHSTG+IKY+w1fSt1T5LufG+C3/BNLwCzi7RBhnT/gIJvvfTjgfPEViw7FpKAQW6hfBQIbk3
	q9YYnfsYA==
X-Received: by 2002:a4a:ee0d:0:b0:6a1:1269:c776 with SMTP id 006d021491bc7-6b6fd6c5428mr5703943eaf.25.1788565766789;
        Fri, 04 Sep 2026 16:49:26 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:4e::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dd07214bsm5003504eaf.10.2026.09.04.16.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:49:26 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:49:23 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH net-next 2/6] vsock: add IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS
Message-ID: <aptZA/uA/6Cwi/Ne@devvm29614.prn0.facebook.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-2-9995383e9a8b@meta.com>
 <20260903230146.DD5351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903230146.DD5351F000E9@smtp.kernel.org>

On Thu, Sep 03, 2026 at 11:01:46PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unreachable connections are forcefully closed without notifying the transport, causing zombie connections on the remote host.
> --
> 
> commit f3fdca73a2fc67941333bcc7521ccf2e755bdfaf
> Author: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> vsock: add IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS
> 
> This commit introduces an ioctl to assign a guest's vsock device to a
> specific network namespace. When the device moves to a disallowed namespace,
> existing sockets are reset to prevent unauthorized reachability.
> 
> Link: https://lore.kernel.org/all/20200427142518.uwssa6dtasrp3bfc@steredhat/
> 
> > diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> > index 29cde17e08f31..ad11f0f56eb8a 100644
> > --- a/net/vmw_vsock/af_vsock.c
> > +++ b/net/vmw_vsock/af_vsock.c
> [ ... ]
> > @@ -710,6 +751,140 @@ bool vsock_find_cid(unsigned int cid)
> [ ... ]
> > +static void vsock_reset_unreachable_sock(struct sock *sk)
> > +{
> > +	if (vsock_g2h_net_reachable(sock_net(sk)))
> > +		return;
> > +
> > +	sk->sk_state = TCP_CLOSE;
> > +	sk->sk_err = ECONNRESET;
> > +	sk_error_report(sk);
> > +}
> 
> [Severity: High]
> Does forcefully setting the socket state to TCP_CLOSE here prevent the
> transport from notifying the remote host?
> 
> When the state is set directly to TCP_CLOSE, a transport's release function
> (like virtio_transport_release()) may see the socket as already fully
> terminated and skip sending a reset message (like VIRTIO_VSOCK_OP_RST) to
> the host.
> 
> Since this ioctl can be triggered by a guest user with CAP_NET_ADMIN in the
> init user namespace, could this lead to zombie connections accumulating on
> the host hypervisor, potentially allowing a guest to exhaust host resources
> because the host is never informed of the dropped connections?

This only happens if the host-side socket is completely idle. The next
pkt will trigger virtio_transport_recv_pkt() to respond with RST. This
is the same thing that happens after VIRTIO_VSOCK_EVENT_TRANSPORT_RESET
or virtio_vsock_vqs_del().

Best,
Bobby
