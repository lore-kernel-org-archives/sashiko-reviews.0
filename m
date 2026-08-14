Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266F3463B8C
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 11:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707007; cv=none; b=PvDBhSLhOrNv1Ym7IKriMs1lA/8CNSX4b2JeJv2Bf9AbNGYAjMfpI+i2DpYAStj/rkqVtE9lMIBciIQYS+7jkciI1N2+pjTdj4wFqqq7NkEIRFh67Cu6ihgi+U9Bxy9VgZyOd2LvkYwaMkwSZSQlrhcovUhLyvMmrO+bLsIa8hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707007; c=relaxed/simple;
	bh=4pCzt5pUQqn786NmWLBD4jR+rU80mSiTqahG5xTY7DU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a6oyMScwRY9MKcmNPN7YPWQWY2eNrCcPMK57IBVKWxjpng0W4osz5A0deZI7zE5tG6DYG3t0kug7oBuOdWa87iJqqEwYcvf/ZHLNFGAjK/kGRndAtlxNB5Z+tXYyBi+agDui5/LoU8xHLZM76548SlqUPANl7zr+cfK2enEimy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oYC7J8OE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oYC7J8OE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de008b020so478250f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786707001; x=1787311801; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qSRVi6rE8VMPSSkScWq+jHFmOMJRNe08YnZV6a0P7BI=;
        b=oYC7J8OE3zumhagNUuFAVbTCqRG8wSRjJizhqLnXrY8a6PWjXi2IiGAi5Nsw0I6jrK
         PwMRqxLtCxEuTF9QlJLgZVycZTgyVlb1WTfNbEywsCrOa6hzpf7b73eJHhDzWX63hJbA
         uHgsaMWNlMaIK7xOSXwawJuHAfwB5b5o7zGLQPijIL9Tg3HK7jFEs2A3PNDgdIusG+JP
         hkwxMpIgyy6BmadcViLf2r7QM3nZ190KlS2JxgaGDrEeuF2rV6ipUz+fUhsqODQcUA8G
         zlFZ0DI1eGOZomxmQAEyOE6C7BnaAsWzGhPNDp3f4DrfLmzqI+v8K4gk1RES65ocb1tY
         CrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786707001; x=1787311801;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qSRVi6rE8VMPSSkScWq+jHFmOMJRNe08YnZV6a0P7BI=;
        b=P35JHuJadg6dWek11DmxcBxgjBhY0Gr4HRmPrvLy2dUXzLpPEIsqqOtfvj4ZoQnHfX
         HqutZEJm4eFNUAYcs98Yo4aID3A7ESEDjdMkhTYrNi/xGBXvdlFNDnvpgoZKLeAf0+n9
         Of6haBr9Ps3B4D8ApMcdiXMOBK3DuJQ6g3grP/jXzzLfZkMoh53egWGZJkuCtt/W8tHJ
         Yq/0EwVknunX48a7qbseZAMURQ/g1RKNCNVIVx63aNf38ctvX2YWHsV/5YgSi0igdVpk
         uNi0wbv+sN5paiUbSayedZ/wBmjW8oy2AtqakwfiYpsfsJsGsvU78CjF+YYSWxqqHBXT
         QYBw==
X-Gm-Message-State: AOJu0YxpoGmgGdus/KW1THE7XsJ3pM3pmiZnz64su2aZW5dnMkQbPcQV
	iTSn+B8kfXy7S/OSvDc/bhNAJgl2EuLGs8DYkinBhMl9nTd35BKd9770cmQZV1inLQQ=
X-Gm-Gg: AR+sD11hy4DGftO/LxMOkACf4GHUn4tmT5mM2eNvYxF5lBuXp5CXU+qHnpWlF1YUulC
	MO2073SCMhs2J4dOM5tHBOg8TrZL2S50V5fE3PK1KC2SHqQbRq43RgCMdoYNjT9ItS+QU3TbIT1
	54KxW92Vc3590YrMwbC2fdtICtm5cxurO+elwgXmRAi+x9c+NWaSGnhxr9QCrPBjWDEuARfMnIm
	TLTt3l9pAhT4uY/uyQ1Ry/F6YeN5shXgjHArgUcdOYcXmZGCAPZm8n+BYFpAwNVWHQufZSdRWCK
	WSg4QVJdpCyEQk+9qNBb9ZFIPgkfl5nib37CzN6iltPwK+gDgS8KtXvRy/9/6Xpe1mBPhHKj07v
	c72f1IgdGNH01Nih0qA3dO9YuYK+loxeQlc297zbpauavP85k5C+dc9vq6vejxY9fpuggKpsZ6w
	NhfMmZz4lhaZQvux2ltC+zOqI3DxmtnH9Bx0scxcdeb88a6Oj0oVAorRgGoXqaq1IqAvDQcYA=
X-Received: by 2002:a05:6000:4022:b0:47f:7ea0:6c20 with SMTP id ffacd0b85a97d-481607a6158mr7464630f8f.15.1786707001164;
        Fri, 14 Aug 2026 04:30:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815f2cc811sm7217490f8f.33.2026.08.14.04.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:30:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org, phucduc.bui@gmail.com
Cc: sashiko-reviews@lists.linux.dev, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe
 error messages
In-Reply-To: <20260814095120.235F21F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 14 Aug 2026 09:51:19
	+0000")
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
	<20260814094211.25151-2-phucduc.bui@gmail.com>
	<20260814095120.235F21F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 13:29:59 +0200
Message-ID: <1jqzk1lz2g.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 14 janv. 2008 at 11:51, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Pre-existing issues:
> - [High] Preexisting dangling pointer dereference (Use-After-Free) and
> double-free in the `meson_card_reallocate_links()` error path.
> --
>

Yeah, that was picked up before and it is related to the use of devm_.
It is on my TODO list

-- 
Jerome
