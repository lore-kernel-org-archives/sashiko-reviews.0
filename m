Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A938A51DDED
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910210; cv=none; b=AKK7NtvFy8HIHTZMiOmYxnlx1BGUjjW2a+8ffN8OQvajfwWJyvzJSKrhNG2UmE86KQivyxd8tBcXrXpxFPV3zDCAmfVGRN7kGMVKz3wk6S5bqEljsZLN6jvJbuph1vsdTGrLLJGyG5BxJiWW3T+w/35cKzb9RjzmCrzoJcjpTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910210; c=relaxed/simple;
	bh=7nzPH+spIl+VFhBQ0La9/DW0fBZ1+V8PlC/sPvoM04Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlOaGqGRxCktexcon4d8cTV5/ANOOOAaeRr5U76X7/FFZFPwCDm6T16fm2CXKPHu4mA/9Vh8i9z/v3qRjfFCU9Jme796ctx7W0mMiqY6w50dqLH5XRfuH+VsLkGa3KBjgo9P2hgVJoM8r52NT4AlAggBxOovW3+0Rog/7hFR4sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XBpqft46; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XBpqft46"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab8309dcbaso2329533a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791910209; x=1792515009; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GqaPQWFTpGy6Tato4Cnm3u7MBWIxvKK7hZ5Hxsyu9Wg=;
        b=XBpqft46zbajAfTOrWFc/x+7xLpf/2DLOiSYS3MuvkURzNgeFiEjk08HLhHQeXDEL4
         J8NXx6AAwJ9SLwL1xh/WCw7tK5cjy69peU7UnmbAdClo6nDblcZi8g0gwv+/YKCIInNs
         pG6ARGdh0iwpQs/JlZZPfZPOG/JvsvOWiu9FhQY8iIGHoJrKZMk3NhKHKm6cK45oTByA
         CVhQP+pDTI0YFwKEER5xHuHB4h5TLutEbgS8n0SAY3g47c9UUNjL3VFUt4Z//2pXqgZ/
         pTx7efu2RlATT7Imzr155bcwzmHr3Jw1IgnhBfOF/E3ISzQFI7+p6H/F9M4U9hjDGtuq
         tH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910209; x=1792515009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqaPQWFTpGy6Tato4Cnm3u7MBWIxvKK7hZ5Hxsyu9Wg=;
        b=HgPyQjNLqzfZHax3NQz1PxmdqoZi1yAgSm5bYaUVmEMBnNBOVCrV+6lgMZlOdV8QCL
         Vn3vPBAu5evs/7/x7+dBc0bp3OdCAI1KPbntE72Ow3s3EaWopvG8c4XPRtofNqt1QbRA
         f0Lq70TAApcaiS8tehAAW4DtOgKVVuDK9eaYJhd6UVwphTSrWRHCKkNyWoZe7h7CMplb
         ThBgoOdNAWjIVrQmtK64nGQOiVQ4iOKBHA+vOhqZ3XCZ2Jos9ofXXeEgNM9orYbRK6mH
         6nVEFhrptBRsCFe4KCn/JSpEhNA3Y19UpOpqyNwxeBelTc9GJhZqiVuJTSwzV/2I4A2Z
         +kkQ==
X-Gm-Message-State: AFq9FYI8hegXwd4xweWWiKOaArCqIIsozXSIrLV+H/Bc1ldNgnKqnLpI
	9EY1gzXdRkZ0PvGHNG1vFe4spC6obP4R4r5DpHiMxVNBGBl81KlWANSGW4ZIAYB2ECYjEYr+0Ee
	8IxB0aYSH
X-Gm-Gg: AYBFou0NdkmoIwk73QnXxdGUVlmZICKrRl8Qdy/LmWIKz6wujYWsYwiCo06cIIkKHnL
	HS3PDEozXdvD7rwLWPctNUhxa+yQ9U80y+X4t2+65elOGB1joS/ZDQODOzEEDaU/Qp48qNPQrbj
	T8bm2XobS+uTGVzlo3UFMWxCUy0OoQNJ7JYXwmnBayXUJlqC6nuIYk6k+s2UXkprth8pz8jFlMH
	BAOVJoHcvDtXuKUpcEPuo9hJcALeU0JU1ma5tt99r0kVWNrFHq+GmPaMm5pUa+doKZEYT7j4lBe
	caAU8bWICAxJbeiS0b9rweSt0Q3ORy5rmoOLz9U1c3POlUu0vQiGCj/agcdl+WzhHBDWIQmweHn
	Ro1+fA4s7+wuMAvBatrHgOH6SQPSGu4A7UAbduUtIK5P9F0FEk1uMX9j16gdXoL5sPykIXnPuqw
	6dw835dxHFxAKGEZw+dTISfbQnhQyJWsx4/w55BNG7Fp77RZ2eL4rHCqwpV5rb38mv+Sxjkn7hQ
	DX5nbulafcNSn6NCmsNM4HhmICj059laFc=
X-Received: by 2002:a17:90b:1dd1:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3ab3aceba09mr7658162a91.41.1791910208352;
        Tue, 13 Oct 2026 09:50:08 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f3db2f5sm410850a91.1.2026.10.13.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:50:07 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:50:03 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kexec@lists.infradead.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v10 11/13] PCI: liveupdate: Freeze preservation status
 during shutdown
Message-ID: <as5hO15vdv3fnMeh@google.com>
References: <20261013162529.1928093-1-dmatlack@google.com>
 <20261013162529.1928093-12-dmatlack@google.com>
 <sashiko-outbox-170132@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-170132@kernel.org>

On 2026-10-13 04:39 PM, sashiko-bot@kernel.org wrote:
> [Severity: High]
> If a user task exits or closes the Live Update session fd during system shutdown,
> the LU core tears down the preservation session.
> 
> When dev->liveupdate.frozen is true, pci_liveupdate_unpreserve_device()
> returns -EINVAL and leaves dev->liveupdate.outgoing pointing to the FLB memory.
> 
> However, the LU core ignores this failure and unconditionally drops the FLB
> reference:
[...]
> Will this leave a dangling pointer in dev->liveupdate.outgoing?
> 
> Since pci_device_shutdown() relies on this pointer to skip disabling Bus Master,
> could this result in the old kernel leaving DMA enabled while the next kernel
> treats the device as unpreserved, creating a risk of memory corruption?

This can't happen during a Live Update kexec.

kernel_kexec() calls liveupdate_reboot() before device_shutdown().
liveupdate_reboot() calls luo_session_serialize(), which takes
luo_session_serialize_rwsem for write and, on success, never releases
it. luo_session_release() and the session ioctls all take that rwsem
for read, so once sessions are serialized, nothing can unpreserve a file
until the kexec. If serialization fails, kernel_kexec() bails out before
device_shutdown(), so no device is ever frozen.

So during a Live Update kexec, unpreserve cannot race with devices
being frozen, and the outgoing FLB cannot be freed out from under
pci_device_shutdown().

On a non-kexec reboot or poweroff, LUO is not serialized, so the
unpreserve can fail as described and leave a stale pointer in
dev->liveupdate.outgoing. But nothing dereferences it at that point.
The only visible effect is the "Cannot unpreserve device after it is
frozen!" warning, which seems appropriate for a session being torn down
in the middle of shutdown.

So I don't think any change is needed here.
