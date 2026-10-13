Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C78451DDEF
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 16:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910610; cv=none; b=rt1mgbcJ4JoqoOXT6lWptYHKyx9JwEa3UltQdy7vtoltrI9eidbN9q+z17SBjd419ixRsOguftc+1oRgvavfJrWpXgUunfPFR0No8aAEtlgWe9vEaeR2NcjTs9VNM/uBsaoWVpUNEjfmIsd9jm3L0kSSR/blW77XXOXhAmYGYr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910610; c=relaxed/simple;
	bh=YYJTbwy0HtrIEhdzcWsomzA4nphoQkU7Pn2YJRhRN3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTrO4/LLN/g5a/L/Gu4UAuxS6tIrM9Z5lWcrAPcPP5VyiJKjK9vlnupCB5GIHoFF68PhyrSu7CF8dpVSW+CwA9OTVpWc/oDl+wUVscSPk51gtkarlf0C/erJs4J1Kidz4+9zra6g3pozVLQbLjIl9VOaGIpyUMk/FZMsxD7FCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RvymkDoq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RvymkDoq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e836252e1dso26134735ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 09:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791910609; x=1792515409; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Di8aE6KdoZOnEQFh34NIGAtRDEHWCfZKwuwkHlmj2kM=;
        b=RvymkDoqL1gdJBYtUgwTJ0LlWADpOjR4Y3y4O7WN/qSTbiyz5EE3xNxPJXWdEIyMyq
         hy2CICIiHw7gFMJZSd2EmVAZw8WL3XNejukPIsVz6pPJBeHlF3YMfTP+598Ek1QVjxvM
         GInbo3dvsYimU7tcM5LQpjifAeSupHi38vgwNMtPi+YrjZJXNDOHeqDeucRIMynvC4yQ
         DToZticsDaDQjnD3hdiQIQU6Pt+oF4iBewePnuv5nLy6xSkP6wSBwjQy2Uy7ux5+Jo6D
         /DRPEVmva5DjjN/vrV6Hbz5OjbI52SObm63wnS3dbb1JO56COY46xeM4TugG70NHKK/A
         GPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910609; x=1792515409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Di8aE6KdoZOnEQFh34NIGAtRDEHWCfZKwuwkHlmj2kM=;
        b=DP5d763ff3P7qdJM/tp2h0YWqfVZUviS7FDgIBN12Y1+8C+Rp7KObYXAcVBXD7677G
         5+SfI0Mw9YNLwSl4mtLLJSIE2Mjp71mtov8Nhe8P90AejbdD+G2svGa9yVe5pfxcBfhp
         ZFCzppawA2oOyTl3qEJHr2uRckSvbVfpZFa7dgJYJICacULedZoUaM9awCrMqk8hjqXh
         p8kDPrv9wB9xoBLQiZfC+cxfdARyYRDvOGmH21d9qKG3u2s+aSHkuNZE7RGzgloTwp1l
         lB5oL2+M11qGVEcJqZgeiD0nksXcK0bE+PCJ+AEQkVmrutkmpgGw6E7IKRO6UOjIDO6s
         WBCQ==
X-Gm-Message-State: AFq9FYLH85qA/QMtOz8RJxqY3DnfSueCOTUJnfUJCWE4qKyupotl/pyh
	/rTXcyefYbVt+CORc/xD7+e2/5dd17nS2L8+vzjula2RkuoQX0PQJ5dzpzpYhJvkmmFRYLm+yb5
	yEr9z3Ack
X-Gm-Gg: AYBFou3lEMa9owZl6jNVGMfZzfu9z0nD/0xF26735J3sCYxY8PlMleYLcW9jH3xT02l
	7KhEtu/2OSFKH2PeOsMpCGXblpDTIycpvsiKf9KMKnKtNuNiywI94NgKMgBtmlBP3d1VlVEy4dT
	PQs4lELyapsFn4myKz8qpui/C5oEEovHEo3oG92tznsj62YitX/VLe8BaM2uNPB++BPuMBnyqeE
	KHeFdqRHWFIuiboYLTLZBNyJsj6XeGvsWKa6Oe1a3b/OoA6rfVKAPrd0deHaOl0rKQPM0hmX7vr
	wZOFbb+R8Wp8BrlSYQayh1zzSh9VtD8kU8xnz/G8Oe+Bs6TE6ERTWw05aZQ22E+ReFS+TzaMxRL
	YSK/b5ZjMJkYVVzYm9ldEwjParZyjM9SvbvnvqkuRsFnoEXnkNfGu7nO+3mP0fjmkBv9pk07f4X
	HKUK/O6JgvOMRK6OBKTmGEFSqiKbbnal1ddwIfUFEXLPFeq3YRC8wBnbVrIbSXxBDlxWN0gBTEW
	3B6jx6KtDorhWtHLGuqkISg3Q71mqSbFiE=
X-Received: by 2002:a17:902:f612:b0:2e7:c821:3789 with SMTP id d9443c01a7336-2e842ce1b19mr106967855ad.43.1791910607036;
        Tue, 13 Oct 2026 09:56:47 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a04012sm60860835ad.1.2026.10.13.09.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:56:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:56:42 +0000
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
Subject: Re: [PATCH v10 03/13] PCI: liveupdate: Track incoming preserved PCI
 devices
Message-ID: <as5iyt9-8btokzCo@google.com>
References: <20261013162529.1928093-1-dmatlack@google.com>
 <20261013162529.1928093-4-dmatlack@google.com>
 <sashiko-outbox-170133@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-170133@kernel.org>

On 2026-10-13 04:40 PM, sashiko-bot@kernel.org wrote:
> > +    if (READ_ONCE(dev->liveupdate.incoming))
> > +        pci_WARN(dev, 1, "Destroying incoming-preserved device!\n");
>
> [Severity: High]
> Does this code risk silent memory corruption by only warning instead of
> panicking?
>
> When an incoming preserved device is destroyed, it is dropped from the
> kernel's resource tracking. However, the device may still be live and
> performing DMA if it was handed over by the previous kernel.

The device is not dropped from tracking. Its struct pci_dev_ser stays
in the incoming FLB with a non-zero refcount, so if the device is
enumerated again it is treated as incoming-preserved again, and if it
never finishes, pci_check_all_devices_finished() still catches it. Bus
numbers also cannot be reassigned, since the preserved upstream bridges
keep theirs.

As for MMIO resources such as BAR locations, they are not preserved
today. That will be handled in a future series.

> > +        pci_liveupdate_cleanup_device(dev);
>
> [Severity: High]
> Can an incoming preserved device that fails enumeration here cause a resource
> conflict?

A preserved device coming back with an unknown header type means the
hardware is probably broken. The PCI core cannot manage the device
either way, its state stays in the incoming FLB, and its upstream
bridges keep their bus numbers. I don't think it's necessary to panick
the entire host in this scenario.
