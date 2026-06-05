Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8272403E93
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 06:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640810; cv=none; b=eGS07K8yV44vYmW0NAY15+KPab2g9Z7/2+WP4O/+JWL+pfvHCJBiLb6gAVMDivopiRHG/pBKTbT26Yij3p3xnHt3M3vauybWl6l1mwHj5smfoXZ/ING89xbczcBDjPqOmHqijc0yYs8NaxlczjtZ1VUm81oQlbmf/GgxUrjU69c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640810; c=relaxed/simple;
	bh=O96Kd5nCMNC5vhy8bUzXigz/IEAI2pnsxYggVkV7Sfs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=awqfDsrehc3mwahg7xzPaH/8Ye8pmTTyfK4Gk8jB2ImekVGpvH40qhP2KICxoTU2p+eVKgZ2gkKZ87sefeSlIbKuW055b261FvpwtFHAn9tUIBR8QFH9x4Wi9/KsS7P9gEuFVOqFHDo9G7LV8ekgV7/lNKK7PVA450c78XCqFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z/WT6d2P; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z/WT6d2P"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8428384f31fso1124324b3a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 23:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780640809; x=1781245609; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=khdJqNPKXPEiqKWLMRj6izd0dTEEX7BxQCSIjhtaalo=;
        b=Z/WT6d2P8n6wKokd5acsYc4Y0PlAoKRKPlw4oV/0d+NkvA/mSIvari3UlD9xNviWal
         Uy25vS4bux30PVAcO5cdNPCiPINQu8skYGRQoch58OxuL6dHsRiupeMs59FnldzFuR98
         qO9fLvxbE9+BkHYPG3T6I+QGy5Q7OWM3IAOxsbqdsaXm8BIRTcC3iPUKyyUMoS6X7chM
         spEYL/qAtlTK5ZQ80hHFnZJUMwafZSEdASejkq9e5+8Dem5I8TPbVOaEuth+9yKOkmhV
         WSwJPnWw93sxQWZRoN6kYQo5JlvOxZKgOqooygl23F5xnhxG7QL1tFcY54aZQ6hl2zF5
         cKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640809; x=1781245609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khdJqNPKXPEiqKWLMRj6izd0dTEEX7BxQCSIjhtaalo=;
        b=O6WmL8y9kFaxvGz3+zPe6uQNLRt0qWwT/9qUF85GDk9BfFu8mQcgVvuTnu3nzayFKU
         x4H40bc0RTnSR/ZgfpOD9RvFUqyJwfFZgvo3aZJM4S1ODwj2mE0nPBIGH0fvupwivbgK
         3RsnGhKS4Ain8lRkzrIZWz5r1HkDt1/r3Eb2r5HG+jEQIVTboiUE91w/6lgW8IffsTAb
         xT5hakGry/g5bVMWKH1n0eLzXBiNFh4i5RuQvPvlN6rYf9r8A9ye5sGWkYCosG1yprEl
         5jMvdmJUIUbyh+Dnq3ETHYg1LJ85+QvHR4MM5GwQhmu3JdukEL1tmbNn59IDa7Av5TaU
         PzMw==
X-Forwarded-Encrypted: i=1; AFNElJ9gGo8fCldirUIBpcTw4c8Qrcxxp0mo5sK7LRwKu1tNkvC8SXIrNKy+HEaXrtlLezmfjyqy2eDYw0etY4soDAc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7OUMGOMyKjYRT+ZhAYlfcwatmysdVNpg4Zz9ToXxMgZRw6i6a
	aGxKXr3ch/VMCKwNqXuFsLuYV08e2Q86uTItMfOIwUOfkIL8pGupLJVPz6VytCsAlsNsSXJwpCR
	ITA==
X-Received: from pgbda1.prod.google.com ([2002:a05:6a02:2381:b0:c73:bc95:cca8])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a94:b0:3aa:f9cb:d438
 with SMTP id adf61e73a8af0-3b4ccdc2d18mr3060292637.21.1780640808801; Thu, 04
 Jun 2026 23:26:48 -0700 (PDT)
Date: Fri,  5 Jun 2026 06:26:47 +0000
In-Reply-To: <CALzav=fgi_ezr7JV3to=RM-RC7sF_XsEcash_+vp65J-jXnkWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CALzav=fgi_ezr7JV3to=RM-RC7sF_XsEcash_+vp65J-jXnkWQ@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260605062647.4025725-1-praan@google.com>
Subject: Re: [PATCH v6 02/12] PCI: liveupdate: Track outgoing preserved PCI devices
From: Pranjal Shrivastava <praan@google.com>
To: dmatlack@google.com
Cc: linux-pci@vger.kernel.org, sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, May 22, 2026 at 2:28 PM David Matlack <dmatlack@google.com> wrote:
>
> Gemini found 3 files where pci_dev_put() is called under a spinlock:
>
>  - drivers/net/ethernet/microsoft/mana/gdma_main.c (mana_driver_exit())
>  - arch/x86/pci/i386.c (pcibios_fw_addr_list_del())
>  - arch/powerpc/platforms/pasemi/dma_lib.c (pasemi_dma_init())
>
> OTOH, pci_release_dev() does not seem atomic-safe. On s390, it can
> take the zpci_add_remove_lock mutex via pcibios_release_device(). And
> on all architectures it can call kernfs_remove() via pci_bus_put(),
> which takes multiple semaphores.

AFAICT, Sashiko seems to be wrong here.. pci_dev_put calls put_device()
The put_device() doc clearly mentions might_sleep [1] to warns that 
dropping the final reference may trigger a sleepable cleanup.

Any existing code calling put_device in atomic context is in violation.
put_device / release are *expected* to sleep.

This patch doesn't introduce any sleep-in-atomic issues.

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v7.1-rc6/source/drivers/base/core.c#L3812
