Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12BA37F011
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394543; cv=pass; b=iQokbUkaW+hkUN8yf3qI/XgFs3NAQ8Bv7EshNDoCAAhk6lX/py7/vNkocIBt0/RLL2JYdFrpE0ZpnHXsUnVRZl+ARpJj8Ya7L6o+LJt2dOjxXKys30WB2Kt94Ju6lH0snkbLHFU+FXKpufdPABollCBlBAsgNRIUHeNVGut+rmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394543; c=relaxed/simple;
	bh=0gvLGFThv2lHT+nyPjifExNtH/ts5i70ONfWfPnWqh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQNS7j6irA++KFYtJAP+5iMPxqym1GsyAw8GoV8igcC6el46oqUZuw45mlf1ZM7V6I3pwLgwCSOqwnLGkehqtOaMts/IjjkhIoe4tV+7WwF5EfKhYL3ZZ9k5ovd2jC2COUbmD7eaWvfTCbBDZ4Ccy2WAfU2XZkt7rzDzLSzszwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmRnCT6o; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmRnCT6o"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf20f6be6bso23677825ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 03:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780394541; cv=none;
        d=google.com; s=arc-20240605;
        b=Rtqpi/fmtIZPD725F0YHubsUPYywNL27y6uvXOzeCfQp12FCSE9tYX05MMD4UhefO+
         nKgqEBALT6hBMY6Phvi5CruOcPwQdnvWz5k03a3skpTuuSiCM/2HUYBXKv4TKB4qS/9m
         kpIjotxoUY4mcLttynlhQj6yQzzUnIrVM7Fw+qKii8KzfZfdI+0KiVuygntG0JlUoTWC
         NCiMpd/WFdHntcObsRZNsn3nmKPAVAEfsa2rAdcyNLRy81FOxbEAODAzgWLoWPBigSVI
         EoTpyLgoypryy0Wnh0VSXd+n4uOXqFBG+NVscEED4jCq8FuEyjhSqGPYkEiIUFgHJZsr
         JmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0gvLGFThv2lHT+nyPjifExNtH/ts5i70ONfWfPnWqh4=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=VJaTnjWin787QBMsccXwexnALiEw+lgIlN54CerFucDbdEIJ0QX7sdMXKGUcQNQCSu
         dE+NjOEbM5Q6do3cAELCH2B1MczyuhGKJ885XpbtNuQfVXrc4D5gbaUl9K+YhlokzL+b
         p4Ytc9MAFgnbK/FjN1ivR0OyDSd8q0KlOS7JWJKj79q8H7fowq/vsncDbVFHcQEWowIW
         fD0jt3w25ozCiaPTXbK2PPW4OdasDfnlokieyfgAIsvhZK+j5DqNqTNllACw2q1jNjSS
         oN27qR30jHsR7eT+L5mZxDuIfBOcYyThX3WjqxBkO2SMWj/9mYEUDymSzZf4EoFZnN9C
         w3oQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780394541; x=1780999341; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gvLGFThv2lHT+nyPjifExNtH/ts5i70ONfWfPnWqh4=;
        b=AmRnCT6oE0ldgwtHF3ZGyvJ8yXWRHq8uIGrorI4YwFCPGcax/g6cGH+7tsPMsNqcYC
         2o2ON3gxQjAjzYX5fBQUp8SB4RKJpDjJBIswCdRkrL7lOrJO81HzqjQx+Yzdf8uznvvq
         ZlHQBIv9Rdicf66wNMQd/K6oFMtv8zLQq6QLLIhqX13eGJjif/OQ08q0xzrWj2cWCizx
         Wjf2Iw2KhyIJUWhXii7mWdRZ7Z2856MTigDw+RAoRgLKhX0paWNucO1P4LoIBwUG6GT3
         cHcqGMiVuIeaRFb9P12DUYmx7f+Q5TWQ1ZRTJuYNOW8ZWZgG0I8bMAwYiM/cXwU94DGi
         1yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394541; x=1780999341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gvLGFThv2lHT+nyPjifExNtH/ts5i70ONfWfPnWqh4=;
        b=WH3wiCdqHvWEgTKqNL/TIpZlv5nLpKuSrcisDxXOGMe8Wa7GFc+TSGl4zwDVCiwBAL
         OvhH1CaHuCrDQ8yGWNFeH6pM1lqG+pMsXDVVQdvcE7EuZD/iIc03K6lIJ78EsbiQg7K3
         WRMimxpPRP6l8acXvkutTZ1mut0Y6dlamdqOfyHxlwx9d07fUQiZ6IwJtJnryUufgnLu
         Rb9FiLWRGcTejKZIXAnkEe2yGMmS0FynZupH8e7dS6NMxzLrjAeXzDbNmvRpbZe2HSYv
         rJGRlVgPPsZyYs3HZqsH3ms4xsY2dRYnjlRVmJo0cL67Ulz0BrPj1k5DYhEM9QLfC2GA
         W2CA==
X-Gm-Message-State: AOJu0YxBwJttwhrX4zloQjffJFCj7aVn37CPlaorHRZwxp+RmibCJnF3
	5OI+EzE2MzEDz9k6riNogY8oiNvp+VhCvbIWiqPfRP56yy7Q1SyBQd24Exb5soE/MXLLnWAgWB2
	HXEQR6puvux/NytAwZ+Qe8KbDndMbH7KtAqu2
X-Gm-Gg: Acq92OGtfnFUgCqX/g9Hj36uaT3R5V2ubRNgdd0P8iPniSnQZbeBviqhRFuuaoVYv7Y
	bJowLOO7LRgz8DjGvB4XzojleVPJMhXOSIwYS7Dircl3utvL4t3wQZaYB9RhLU/6uTsvIBYpUoD
	AhT/kt/g5ZdrlfWVCO4nZlYTNLn1HPu8dTJEIw5MooITKua7YK0hS07Il/r/qxU2NYO0soz1gvN
	SXXWIi474eZfFtMAMjaE4mYx5E+X3UvojtLPRm4ivk1QfidUoFFiMG5rpi9pKDrLak3iT4spZ4K
	lEW/67p+uR7eiW7PNY20hW/ocfQsU2dAbM0XUh/ZH4GwN4F0
X-Received: by 2002:a17:903:1983:b0:2bf:23cf:3e4 with SMTP id
 d9443c01a7336-2bf367d9da0mr163447475ad.17.1780394540758; Tue, 02 Jun 2026
 03:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522100318.73474-4-phucduc.bui@gmail.com> <20260522110302.349421F000E9@smtp.kernel.org>
In-Reply-To: <20260522110302.349421F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 2 Jun 2026 17:02:09 +0700
X-Gm-Features: AVHnY4IKu4cfANumj7wmqQvDtssDhq3TpxXIjIHmGdj6XFJ_23uSlD1EG9gmtw8
Message-ID: <CAABR9nEHn7Fz2RNz2ttp-3NmHX8pAMtVQPuP+z2Qi1v9FLT9+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: High]
> This is a pre-existing issue, but can manually disabling the clocks and PM
> runtime before the devm teardown cause bus faults?
>
> The driver registers the ASoC component using
> devm_snd_soc_register_component() in rockchip_pdm_probe(), which defers
> unregistration until after the remove() callback returns.
>
> If the device is unbound via sysfs while an audio stream is active, ALSA
> will attempt to tear down the stream during the deferred devres
> unregistration. This triggers operations like
> rockchip_pdm_trigger(SNDRV_PCM_TRIGGER_STOP), which writes to the
> hardware registers.
>
> Since the clocks and power domains were already forcibly disabled in
> remove(), this could result in a bus fault and kernel panic.
>
> Should the driver use devm_pm_runtime_enable() with a devres action for
> clock disable, or unregister the component manually before turning off
> resources?
>

Thank you for pointing this out.

I agree that your concern makes sense, and the teardown ordering may
indeed deserve further investigation.
However, addressing it appears to require a relatively significant change
to the driver's resource management and lifecycle handling. Since I do
not have the hardware on hand, I am not able to validate either the reported
scenario or a potential fix.
Given that, I don't feel comfortable submitting a speculative patch that
I cannot test properly. For now, I'll leave this issue to someone with the
hardware or with more familiarity with the expected teardown sequence
in this driver.


>
> [Severity: High]
> This isn't a bug introduced by this patch, but is it safe to ignore the
> return value of pm_runtime_get_sync() here?
>
> If the runtime resume fails (for example, if clock enablement or power
> domain restoration fails), the function ignores the negative error code
> and proceeds to call regmap_update_bits().
>
> Accessing hardware registers when the hardware is powered down or unclocked
> can lead to a synchronous external abort (bus fault) and a kernel panic.
>
> Should pm_runtime_resume_and_get() be used instead, and the error handled?
>

I agree this looks like a valid issue. The proposed fix is relatively
 small and localized, and does not affect the overall resource lifetime
 handling of the driver. I'll prepare a follow-up patch for it, although
I can only perform compile testing since I don't have the hardware
on hand.
