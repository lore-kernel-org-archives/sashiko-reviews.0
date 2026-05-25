Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276531B131
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732780; cv=none; b=E3pgjeU+b15BggKzTuE/d9+ZVdBYwz1K9MV08tmj9RTvLNGLCnIGpKTmgaih5Omw4MX/SPQdWIpjvOE3rPe4skUKEwztS78qyMzDrEy5GuxQ5Pk85iaMtA8UmvrVAH+KAF9Ac/k8c6fQl5zGhQWNLBsA3qlIdZl7UmmHgcvlrCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732780; c=relaxed/simple;
	bh=9jf9tLHFxQ75qHMj/kSwRfxynqtrXqLlCjMLgN/GnyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4cF+BKbfNhV+gNPDTXY50dVo1ap6Tyd/Mo/EZ9UEkTFr7IgddMghNzcgh2t5tYiJw2dXotiEu1LSnWWPcoZUl0bifwOyYju/hKVf0ygaAC5y6HlJ1ygv4JzgvUrDCSZ7U1QA8wX927p6T5Q8jp4lF8GtlR3n2u+N67VE0L0L40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXeoLTtJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXeoLTtJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso5434995f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 11:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779732777; x=1780337577; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpFDzkjuQFRbiLFIKfVeYLaVXgVS8IsCkc5nauULr84=;
        b=AXeoLTtJwgd98I3DP4eBJxKPx/k92INCj0YYtnqRtqXT2ELisqE4rLz22DDm3LAi6+
         43S/gPGyp/DxcJfP7Rqy+JvH23jPLZyaa7DTfbrmJ0fVC6nL/iznV5tA2qosnMciP/Vc
         PpXcJ6yB73HA9tCswlB3mj3YPf9OQ+W45spAQdA73UIuTVTSwFZgU3q/3n7APsIhfNmH
         jq4vKKo8Rm5v4Tf4r+9qh/38nFTxfpjRnAJWUXofLrakS3w8VcgFNucwUNKYL+u33Fpv
         /3KGCe0Du0hGv5OrCRpF8PiMIWWWfcG0FFqz/WduwgTS7i2QmTGMlhbQFYnT/vfqu4M1
         UPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732777; x=1780337577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpFDzkjuQFRbiLFIKfVeYLaVXgVS8IsCkc5nauULr84=;
        b=bQBupy4ai/6aA1EuzdnbTHSNIRYDPCaiw99eYLEKeDZ7H9vpbj1O7zimYs54kVubLi
         WjLDXHOzZjBbyjhIq8re6zhdyCbkiuJrS/dJdUpurCnyfK5370LwuoTHPcdTjbei4ygK
         T+a9GikXtvphvrJcslbf0iumRVNbh/p8Y+Hg+7xNw00FJuNaFWwCQ+dc/R6TifjLRriJ
         V8hmVKM96w+tyBsLpXro/QZXeBq1QACDFtFYaY7vvUHzYLUprUk49bykn4hhUbICa3pc
         VfXJZiwK2Lgd1vC4Gwtm/uGTHKP3ItnqNaKr8vbzATqRkSSB8lZOcuD7nPA8lKg0DzZU
         x+8g==
X-Gm-Message-State: AOJu0YwWW+GsrWPcaC0dYi4b1gFIbIAVNT7taIQ7Muzcia8NrEoOvzBX
	BLUkRBjmtboCtTAEP6kFQ0RhqpienmO2PQbW5LtN38pKvFoh6TB7udw2YaJxoVPN
X-Gm-Gg: Acq92OGEXhT2VwyT2wH9wJMN9i/yBRU4Tq/C2RmmdZRGk1DA+Nk/KewPACNvJA8T5Lt
	OnLcbxUkkBz9fwWM+4DJej3Mh7MIlzIv6/GNsO54APf/4jhBLkCEH2vMynr52nFSsOJvYXQWaJ2
	W23MI9KoCOj0c5FfrjIa7+fCV+Rdnw8nBqyPkIMc2iiARrYT5AE3OoMRybnEVGbmU0ZINZtoDNK
	ttmQO5S5iLus2dCwxeHSproRuXQegFth3moypo0RBTyEIvwpj8IydOvc+jA+KkmrVxZ5ySnNSHQ
	lY8dnyPlfKrkXZh2Ou+wS6ovR1LW2MgNHUjEdnsCnx0KcwaWdev4l6YuGUT6Cz/ka5dr1AGAPhM
	Hd9pLJ4qEQBAfQ0u2W6bQMlEm/L3XKFFbW6BOTHDsgSciAGQl+KfXUd23S1BX4oOCbQrXcdzo65
	AfCSPU8OA=
X-Received: by 2002:a5d:59c6:0:b0:449:c1e8:7655 with SMTP id ffacd0b85a97d-45eb39e1e97mr24856535f8f.27.1779732777297;
        Mon, 25 May 2026 11:12:57 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6ccd211sm36623653f8f.10.2026.05.25.11.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 11:12:56 -0700 (PDT)
Date: Mon, 25 May 2026 20:12:55 +0200
From: Louis Sautier <sautier.louis@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] scsi: mpt3sas: add hwmon support
Message-ID: <ahSRJ7neNt9sncN-@localhost>
References: <20260524210545.1333637-3-sautier.louis@gmail.com>
 <20260524224927.EA8CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524224927.EA8CB1F000E9@smtp.kernel.org>

On Sun, 24 May 2026 22:49:27 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Could these uninitialized stack variables lead to memory corruption or
> information leaks?
> 
> If the firmware completes the config request without a reply frame payload,
> the underlying _config_request() returns 0 but skips populating mpi_reply.
> The subsequent config read request relies on mpi_reply.Header.PageLength
> and mpi_reply.ExtPageLength to compute the DMA memory allocation size.
> Using uninitialized stack garbage for the size might lead to unpredictable
> dma_alloc_coherent() behavior.

In _hwmon_read, I declare mpi_reply the same way every other
mpt3sas_config_get_*_pgN() accessor in mpt3sas_config.c does.

> Additionally, if page is not fully initialized by the hardware response,
> stack garbage might be returned to userspace via _hwmon_to_mdegc().
> Should these structs be zero-initialized?

The page argument is zeroed by _config_request() before the read, at
mpt3sas_config.c:344 (memset(config_page, 0, config_page_sz)).
The bot's own review log notes this: "the code *does* explicitly set
`config_page` to zero."

> [Severity: High]
> This is a pre-existing issue, but does calling mpt3sas_config_get_iounit_pg7()
> expose a data race with the config_cmds state machine?

This is indeed pre-existing in the driver and outside the scope of my patch.

> [Severity: High]
> Similarly here, can the uninitialized mpi_reply and page variables cause
> the same issues described above during the config page request?

Same answer as for _hwmon_read above: mpi_reply matches the existing
mpt3sas convention.
