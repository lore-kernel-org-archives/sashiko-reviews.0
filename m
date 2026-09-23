Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811E149DBA4
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162804; cv=pass; b=FY0mSu4kcF3KJeOPaeZrgbDyGnNF78z2GTnhR03px69zdpuBgQHECBL0xbuuj8iI2QD8pvMtbQKYvMR20wY7AtB3d3w69WJZ0eR3s4BnZxXu9dQETLpyLuvWOSXlxPfHhaggLeY6sJC75tic4YvntjyqqWCy+MzZejbPMsJBB6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162804; c=relaxed/simple;
	bh=YKh7bVY6JYW2EMiYmIgo1vZA3LIPcnqfDJbY/5X+7R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBVv26WCD3lP7htOeaQUw0ZV/3aXp/VYJlRr657az2qCsa5Wca92oued5WkO554Yql2C/TgSmOwQFjR58/sRpELqiueZ/Ulk9Jum5FCPOnBqZAVmcRyaTVAqeZBpu7PznEF+DsO6jJWxPf3nt41I9aOxUOp1rXnYLISvoKpKrCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGRwPkH2; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGRwPkH2"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe57a3aso7097756d6.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162793; cv=none;
        d=google.com; s=arc-20260327;
        b=s2g/zQjJ8/A0J0l4fqKTJ8XJDfLibOymkuEq0dfL8zfH1skcdphAgC2r+bl5m3UwdH
         XQ7HLZbXF03Piwiy0xm4Mg+4HLiL2sUFbREu3PnY7h60W/dQb9ERWgPziviAyem7o1AO
         OrmTZfEuEa7vQyxHXtB61tGIQmxymeJAgjiU+oQ87q1PmMzrVt3OyCaEaqEe40UvD81d
         7eUkul4L+IIw8LmbHMoasMDGkSZWO19eJiqPXciYWORIuHE1NtQWUrTptyvDsewRR4dP
         T/DAv49qD/tElZrQS6wXDTpAFh+JNveUozQ9q0+kOG5ao8ywrLb/+AxFwRUNktwa6Yhr
         S7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YKh7bVY6JYW2EMiYmIgo1vZA3LIPcnqfDJbY/5X+7R0=;
        fh=uHrus4W2MHbC6p85CUiYPs9hCOfwAICvoY4mVpx/Eos=;
        b=aAB4spXCmqZUWpjGfBx4XbZi5z5bLBniKJjimDN45JZ89n0CSRemC8lIZfu8T7C4CL
         7VQ8jx7zYF4QjUbMshO0ke2z/L5ckkZ5D/zzpx9BcsG40+rnc8gcYfnsdUAvXKltMm4q
         iWs0YJP2UAblrveAFwndQUckqdF8/rYqFXpg2RiBA+/Ty9qCXDPyOdB2MDmTgcIuD7ot
         +kM9cJ4egfVPAzSbsurIuc2U4/ZlcTxbCeKibLfoeaTub2x78xQtBJgrwG/McsRP1hwy
         12gIW81hgC3+JRol697PhA0RVm2Y3R5zZ17yg5TDvLpC7YRVu5Kdg4uDeHog/YeJL4lE
         lt9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162793; x=1790767593; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKh7bVY6JYW2EMiYmIgo1vZA3LIPcnqfDJbY/5X+7R0=;
        b=DGRwPkH202H2SefyOdFg+VPxgNk2HUtKZuw9oTbeOON8hTKt3pRqZP3TWTY/ViBld2
         Ux+GrIxIeLrzvgPXmKdo/wgeQnR3Q5DUd7Hn8ECYGKuXrytvcczn4OtcHTfCYE3TgRl8
         Nw5Eu74whgt0ZKZXVijzrr2nf7pFTff9XnfwYE9IACf8LeFQXXXlWfVsnJ2S9fZYt5gg
         t4kMj2l+8g4DZIbJoZ3VoaZ8ckeiBZft/9S5zJ8wvsezlUwDGu383/PGH6uictNfWy9l
         Iib7n2gh50+pLr66EM6wjVgJE4klW8SXtFfnX0Y+worChltY51xTWukix6thvcnNMC2J
         E5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162793; x=1790767593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YKh7bVY6JYW2EMiYmIgo1vZA3LIPcnqfDJbY/5X+7R0=;
        b=tNLtkSZgqibSOyrfUfWA9rVN9R1ZFBoQ02eNuit5GSYw/K/XOlRkVstDmajf11fAiI
         1+lAifPS81t4xurzUG0zc5LPDCHUdvigHUdNk0eqTxna+Ib0LRAu2ANFLafq0vwMY6jX
         G4BGK2u6JNKuhVilpsfdTiZ1YL1f4y0Ymi/HvNbI4moGLbfbaoxxoUvapzCUXMmsFhGy
         yAokT+WcC/AjvtaKol7YEtPw0HmeEaii77A3YS0ZO6fgrcVgsVMCuka79g9BqxlsUddd
         brNWmGWg5OExAOsSq576aIqgstyhteymzEEdhK7gzUTkcyX7AcOanCjtd9fidK8wVwSB
         xf/g==
X-Gm-Message-State: AFuF++k3IcSS7r1owep+6Ls3FDOAiSlJ/9S+9GUj8t81S4isMTWPmfpr
	ErjEWPJ02KxTTWaBl6+RXFNBTlM9EM2yCloF8afciV1kMDPsL89Ba8IB134MeRjIgj+w70Uj0L0
	R8mVVMQjLCZnX+ms3O3EP3ZlK49Xm4vR3wQlIBFeqLsQM
X-Gm-Gg: AYBFou19Wtc8idemP5SuyTrc6TsFbMekg/AZZjFTmZNQwjTsko6lLS1p7eYADlBsAeW
	NadyyPfN3N71nwubu4e1OYJyyny+HX+kV4s9zfOUwdpmpp539gs2S6n1MViHTrXKXylH8SC0oOD
	6s6z/Tw0C/e6OvTBG9nrA49IDls6xYZ4b8ibA1YHu7Cb8bX2jZ4medZUiFO4o5LqXmFw7rdZwkI
	ju84Y3cbc2rXjMC9nofZBGQ/oynmtFuNbmCFBWmUL2CZpDIzJgHbGuk6WOlDJkFT5Cm8sXbCM7U
	djByNhCVQe/MkdONLEhFI0fmm6CmuaiicwFEpT8jEMcgJOpug0XeGcEVpg==
X-Received: by 2002:a05:6214:4b0e:b0:912:3c52:5e72 with SMTP id
 6a1803df08f44-9140c1b4422mr39057966d6.0.1790162792723; Wed, 23 Sep 2026
 04:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105215.1633-1-anykey196@gmail.com> <20260923110236.CA7FB1F000FF@smtp.kernel.org>
In-Reply-To: <20260923110236.CA7FB1F000FF@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:26:21 +0500
X-Gm-Features: AclHuK9metqHwgNkcVEJzrqMbgwYmoN8PIfNcC97UYtxIwR3y1ghSLpIZWCE-9k
Message-ID: <CANHPwAQh_47zOmej2yo-kGPV41xWXqgUbWTZ=zjhFNL-0wengA@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - add AXP313a support
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks. Correct: the AXP313a register map ends at AXP313A_IRQ_STATE
(0x21), so AXP20X_PEK_KEY (0x36) is unreachable and the
startup/shutdown sysfs files would always fail with -EIO.

v2 no longer reuses axp20x_info. The AXP313a gets its own axp313a_info
with no start-up/shutdown times, and those two attributes are hidden
via an is_visible() callback, so they are simply not created for this
variant.

Tested on: OrangePi Zero 2W (Allwinner H618 + AXP313a).
