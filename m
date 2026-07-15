Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96B429027
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107700; cv=none; b=jrBzofMWebdXekUP4nUXvGHlPcxyGKBJvae2n11wu1yhP67/LHo7H42/t/ROqjkW1yQUhT26e6+TSgpEvO1TZMIsv0JSYKDAyLHxg5+SS/KyO7YFmuK05rEu84mGIaXkhT4wAV28SGDUy40yf0nFQr/M065HHO5SDNzR2TXNqqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107700; c=relaxed/simple;
	bh=XLlmmz7WzIflrQBPHIDtKXXqkcj+Jgzs8TFRynXU1iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIQygSa3f04JgQIPtduJKZFcfrW96AhNwaq9rjzVU30/NcgAurVk5mhi9TvJAjzG3wk4iLd5fwfez6d5QnsHHynxL6C/kM/UJ/HZe/RkQ/n6D3mucy65h5Ja+zbbcUW3slJTyx4O7GD6yUAp9hssTr8ExiACoooZ3MCASJ1AZbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zz7Y+dPf; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zz7Y+dPf"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6b5737bb2so4413757a34.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 02:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784107697; x=1784712497; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZnbIoDxi2GapRWlrmBlXMx1BB+ECtF1C6EhxHJoyFKo=;
        b=Zz7Y+dPf7tl+HztpAKe+Q68P2A9C2xUcnPMzxxx+Hz5jEG8a0mAiWRYBDR9EeuVt52
         Z4dT1QcR8F53nclC2yi4XuUERx9jj2xe1Ma2J8VFLBJ9CNWxkvj90df+SC7lJm9OrCl3
         wtWNcriSpQciZxnXM5KsqJuZimsjE15k4JrJ+99k0v3+mG1pjkxAz4s5bFMxLNxPsCvT
         ktrOwjWXsqCqCfhyuVzeyH0kH0dbeWxPTnqJW3BUdjYW2B4Dgo7f8eLnlQ6/aP68v+AO
         0vTvEJByX7qbP6+7Is2TzpCwG27Cuha7bJi7Hr/eORVwe2AMYiMJgOF+oVniTXHee9O1
         Jnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784107697; x=1784712497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnbIoDxi2GapRWlrmBlXMx1BB+ECtF1C6EhxHJoyFKo=;
        b=d1VaEse1q+hFOuYIHafuf8J2HAnFEYNjBJDc+QtOPDm70mEzLUj6/eNJtC3ZTwA1Ah
         6OeWmDb/eYNKxgVvhz5j9u/xaSLTUnaEfk+72seuzmA/ayqab1LI0Okh52kcFLLlKBXW
         v2oqzySO3gwP5lCAaz5QWUJ5Vy+rky8Eawjf71NDtYzk5nljdI6Nb0VBXvWOeUGsKlSs
         4e7x8/ObyiwPxvxi4QB2gt9G0mqR1k8Dy43tt93my3TUUJWdbrX51m+6vjjbicm9efDs
         y4vR/KXhknfUvJnK9+iVrmmfkmXgsX5Sti/LfONhMW6mvU9Qy7r8vq3itvEaJAQqzpgT
         tlrQ==
X-Gm-Message-State: AOJu0Yz1R8ODUtRq2TJt7YMIRgj03ZOnxS2oTU3YboGmNFGQ0m0Z2uah
	ElzajntcKa8nF1+UiGU555MuyZSxbPy9UPJGIM16ISpAdXVQreul5euHr6hIjYtCONM=
X-Gm-Gg: AfdE7cm+6aL80bJX7yuPEl8wkjExHpmmEJzr7exB3WLC/tkzcufDE6soZCD4bTH1EfS
	oWIUIq0UPbMEU5D9v7axrM5z7VKlCIZiXOz0lkZy2BXOi4MpLQ9/6nsGsqPqpIyOTr0cDm81q2e
	Z6RrCeBMC1EBe9Osn8wZznF6k0GSOMhVO3jOcEtf3O6Fq/OqlVtjO/kactZQH0yzOIvdDEV6117
	GUUDi5/ICoF9/HzzIbeMm82wXP/FQ6sJHqAOh95QRqGihNQEDyB4qLhuieSS7aoOWYu5PcXQUK3
	dt4teNs7u9Y9b818dyE4dlI/TcDtXiJNZfrc1/yU3jUzZaIKakdmP3OpOvR2nUuYCkmB36Rz6zU
	kPTyatyGv0pyf1/OfDxUWzj64gAYU9c6OABmZhxi0yxZqo85tTAYfuo+RIsqZJ37TfiRYVa3i+I
	qrRzv6Bd9FTzI3hwWgl6VisIvj2O1UkRmsTQ==
X-Received: by 2002:a05:6830:6b0d:b0:7e9:db7f:49a2 with SMTP id 46e09a7af769-7ec4ab3fed5mr3048090a34.19.1784107696616;
        Wed, 15 Jul 2026 02:28:16 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:45::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec14489139sm9059985a34.5.2026.07.15.02.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:28:14 -0700 (PDT)
Date: Wed, 15 Jul 2026 02:28:12 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH net-next v5 1/3] net: devmem: allow rx-buf-size >
 PAGE_SIZE per dmabuf binding
Message-ID: <aldSrNgB4+EJRI0X@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-1-34bf6fac941b@meta.com>
 <20260710072712.BC57B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710072712.BC57B1F000E9@smtp.kernel.org>

On Fri, Jul 10, 2026 at 07:27:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] On 32-bit architectures with 64-bit DMA addresses (e.g., CONFIG_ARCH_DMA_ADDR_T_64BIT), passing `dma_addr_t` to `gen_pool` functions truncates the DMA address to 32 bits, leading to broken bit allocations, leaked chunks, and possible data corruption.
> --
> 
> --- Patch [1]: [PATCH net-next v5 1/3] net: devmem: allow rx-buf-size > PAGE_SIZE per dmabuf binding ---
> commit 700c87449a5348e02d33589504f632f46bed92e7
> Author: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> net: devmem: allow rx-buf-size > PAGE_SIZE per dmabuf binding
> 
> This commit introduces the NETDEV_A_DMABUF_RX_BUF_SIZE netlink attribute.
> It allows userspace to request an RX buffer size larger than PAGE_SIZE
> for devmem dmabuf bindings, avoiding CPU churn for large flows.
> 
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 957d6b96216b3..3ce3cc14bec07 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> [ ... ]
> > @@ -113,12 +114,13 @@ void net_devmem_free_dmabuf(struct net_iov *niov)
> >  {
> >  	struct net_devmem_dmabuf_binding *binding = net_devmem_iov_binding(niov);
> >  	unsigned long dma_addr = net_devmem_get_dma_addr(niov);
> > +	size_t niov_size = 1UL << binding->niov_shift;
> >  
> >  	if (WARN_ON(!gen_pool_has_addr(binding->chunk_pool, dma_addr,
> > -				       PAGE_SIZE)))
> 
> [Severity: High]
> This is a pre-existing issue, but can this truncate the DMA address? 
> Looking at net_devmem_free_dmabuf() in net/core/devmem.c, dma_addr is
> derived as a dma_addr_t (which can be 64-bit), but is passed to
> gen_pool_has_addr() and gen_pool_free() which expect an unsigned long. 
> 
> On 32-bit architectures with 64-bit DMA addresses (like
> CONFIG_ARCH_DMA_ADDR_T_64BIT), this will silently truncate the upper 32
> bits. If a chunk crosses a 4GB boundary in its lower 32 bits, the end
> address could wrap around, causing gen_pool_has_addr() to fail the bounds
> check and permanently leak memory via this WARN_ON path.

Let's defer pre-existing issues to future work?

> 
> > +				       niov_size)))
> >  		return;
> >  
> > -	gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
> > +	gen_pool_free(binding->chunk_pool, dma_addr, niov_size);
> >  }
> [ ... ]
> > @@ -288,7 +295,7 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >  
> >  		owner->area.base_virtual = virtual;
> >  		owner->base_dma_addr = dma_addr;
> > -		owner->area.num_niovs = len / PAGE_SIZE;
> > +		owner->area.num_niovs = len >> niov_shift;
> >  		owner->binding = binding;
> >  
> >  		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
> 
> [Severity: High]
> This is a pre-existing issue, but does this suffer from the same 64-bit to
> 32-bit truncation? 
> 
> In net_devmem_bind_dmabuf() in net/core/devmem.c, gen_pool_add_owner()
> takes an unsigned long for its virtual address parameter. Passing the
> 64-bit dma_addr here will truncate the upper 32 bits on 32-bit systems. 
> 
> If two dmabuf chunks happen to share the same lower 32 bits, this
> truncation could cause overlapping chunk registrations. This might
> eventually lead to double allocations of the same network buffers and
> silent data corruption.

Ditto?
