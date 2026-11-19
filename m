Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095437;
	b=NcBQq7Xd4U/55JACO5jtsaoHLXFLOijAm+aZ6T/qAHIAHVavHCgI1HVTkkIJQH82wEtu
	 KYBZ3Hdn2trUnZn95hWCfgySGl0ctnXQNZXEYMGyHkmuQjVGrJDeAsciJBl1+qMt9T6mr
	 Kuq9SJ/aSc/c/lYdPy6/eTJl0jezo/v63YOoFlCk+jBSY16lkXOIiIUGxJ6vUR8Bx2ZJl
	 lj6YtkPNf7G6VhARasj2JBH1zRI2TdVAAHBHnGy5xX001rOLgGU1dR9g529TMIFdIEvRv
	 evw8D0J/olR/lUeL3bkO6splrNvnI4oKSpKoCPoutpbWo2G3jfLMNv6h7GZfXlDoNIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095437;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gG43eDCqeq136Np27fFY6TkCdfE16m+EKLT7923WjiM=;
	b=CusBKr2TAMqFb481jcoD0nBzG5iOM4ayCEBlRM+fxxk7q8iChpKC5MUHA5dalq8GuyJX
	 nbRLktMdJjBRfkzUKGShREOxiISUJxfWHHF/36LRZ2IG9sjFMzG8nT5gosN/HrvhpcqA8
	 AVD0UN0GNOxgFsEUg4arKCDPcXQv/8MhpK7GeU8tKOD358owrk6t7PO84TiUw8BDXP6Ft
	 WoKwyzlqT5CNbyMk52Xf15kQJ9d8bZCA/pb1Ebxzi9PGRKnMQt/v5kePQ0SwmJNxGu4l5
	 AaCzdShoWaDnrg4hZyVn9TFCnZB9X2/d1sgTEeiXzk3unsV7xeqpWYfsIRLRiqjkVaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJV3lu4c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4097C606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BJV3lu4c
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 665301F000C5;
	Thu, 19 Nov 2026 13:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095436;
	bh=gG43eDCqeq136Np27fFY6TkCdfE16m+EKLT7923WjiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BJV3lu4cpOWzJJPiI9PXYRUBZdAhJq8JzwPDCXg+7r4XKez/PxqVamAttHxWa0ySR
	 yLcDJPLPrgegecoiUDT98x/Tp9EFBilvrWPCnyV25B/f7jfCMkcKkUxt0oaSGqCXhC
	 eJlGsRe7daolA+ThuyoI1kcI4DXhgcKNV0VbAMK/laLm4tXIJOzpr+qONRbfieijpT
	 kLr+WrhfrwBESlSJ4XMHimK4ooSD8W2Ju3qHHFYncMKggTGYvLlZRLhj0cDZQlawlh
	 WmFi2hUrXK9ANUZgevN4rKLpOYb2AzUpybKBiVofmUHiplhBqF0Tj7uW8dGzt8yKn8
	 aHBEqYB+Xzt+Q==
Date: Thu, 19 Nov 2026 14:37:06 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Stuart Summers <stuart.summers@intel.com>, 
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Message-ID: <kd7u47uhw7kzvfu4a6xxtpd6pkad3fkwlw3lxgt3hdllfpzd52@dw2lkxcd3nnr>
References: <20261118223023.19653-3-stuart.summers@intel.com>
 <20261118223023.19653-4-stuart.summers@intel.com>
 <sashiko-outbox-222127@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-222127@kernel.org>

On Wed, Nov 18, 2026 at 10:49:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] driver core: test: platform_device_swnode_shared() tests
>   unmanaged swnode
> - [Low] driver core: test: unsafe device lifetime in
>   platform_device_swnode_shared()
> --
> 
> commit 456e50d0c4a7cd5e70182bbae38d6d777a4710e4
> Author: Stuart Summers <stuart.summers@intel.com>
> 
> driver core: platform: tests: add a shared software node test case
> 
> This commit adds a KUnit test case verifying that sharing a platform
> device's software node with a second device via device_set_node() leaves
> the owner's software node intact when the second device is unregistered.
> 
> Link: https://patchwork.freedesktop.org/series/175858/ [1]
>

...

> 
> [Severity: Low]
> Can allocating shared with kunit_kzalloc() and an empty release callback
> cause a use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=y?
> 
> Under CONFIG_DEBUG_KOBJECT_RELEASE=y, device_unregister(shared) ->
> put_device() -> kobject_release() schedules shared->kobj.release as
> delayed work instead of cleaning up synchronously, so KUnit frees shared
> when the test exits while kobject_delayed_cleanup() is still queued.
> Also, if any intermediate KUNIT_ASSERT_* fails before the end of the
> test, the unmanaged pdev, fwnode and shared allocations and registrations
> are leaked.
>

This should be fixed by the following patch:
  https://lore.kernel.org/all/20261119-swnode-kobject-parent-ref-v2-1-7ff8bd54e526@oss.qualcomm.com/

Thanks,
Bartosz
