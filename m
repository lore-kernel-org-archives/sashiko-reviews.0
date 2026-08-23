Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD82D12F3
	for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787490066; cv=pass; b=VEi7dMSd5IY5896JTvDC+PznSaYbS+5PS/X2xbvk+zIpvmfddsJHvo6j9VtL10vHuQicqz3638aNDFCGRZlCFQYz7844pFEflveugr/P/zCkWPARlk6tcs4FwSnpYKg4derASvAr0Q1FvdyrQIsV21wDM0hdANhmTiLDIJtKitw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787490066; c=relaxed/simple;
	bh=O9vqDCNyl1ldG7SeHQIKR21U6TYJFN/g7wDlqKknSzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhDXGtegd9Cn1YOq2zu25UF1pAIWa7CmCJ1Wxdx2K89mclQ2M1nPuTpkk88jrCm4nEG4epeO6xv9onyX+Zza91eNgPmRZZUDnhcwqcW8XDEKQOD/1GBhUFAt+nPUjpYJ7VyL6YLD6VoYaColvJbqe24E1PSO8MCywn3Kf9J35NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKXUNWT4; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKXUNWT4"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-836c4474028so29643467b3.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 06:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787490062; cv=none;
        d=google.com; s=arc-20260327;
        b=c1JGZNNG8lip7ghlXTf0eFluvcbgC0PLQ6Vxtcq+n8HE3N5cboH81Ljk9qci1v1DtK
         w3pTovcuKNmA+44XfmTTfZPl9cHQIB6iZ8USvrtAiN0vlzU8fhTaJoGC/e5FE5ZDrEbj
         KYCJSZB+RBrfqEqAlSWFDUY621E2T5ppAOrpd+ba6wtOXKotm+7u3tnLEti5Lwa21XqM
         rVwXXI3Sd573M8ClQxQ/AOlImafrwzZmTwFtlrk9NxgXHr4C1cc0YlfyeaWJStVIXRpd
         88mXBmXdEuuHqqzc9Gu714hdWrQEQ/+gKxodwqVJMm3K7Ph1VPJWr0LVecVVqbkgjAQV
         2bgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O9vqDCNyl1ldG7SeHQIKR21U6TYJFN/g7wDlqKknSzk=;
        fh=fGbQd4DYEQvsG1LNmsnNdfKXnWcU+/ly4y0vYufQFCE=;
        b=f1+HnoghmDggd+gBjRIpwntMWf0ymRc81NZqpie7S4EWymhnRda5kBC4QQYV8/xmca
         d86NYVj72oxr/wSB69gC90lBrFBf+lPBFoTrkZ1qMV997OqIJ/twjA/zkPckprdSaHt6
         M81M74prvAvV8EZYGwmKkcH2HMjAli3eoTpBsSFReCRhNtuwXhRwJyMFycSLEN5WJRAO
         ytgeM2/HlwDnUKXZCH1RWGp/VwN2TVnLDsJLNCiBLGCOlaw/Jcs5hld7QcG4xCasGOZG
         zzPRQu3OyxSlGvJ2NgvBrEWh/+Fxq2kjkQe44DrzaYcCylimyY7IFkBPuAFQz6d37s0S
         eagg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787490062; x=1788094862; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9vqDCNyl1ldG7SeHQIKR21U6TYJFN/g7wDlqKknSzk=;
        b=nKXUNWT4YcDXIi6fYbcp5CIdyAKd2zJ/H8DbxXXg9yhpPLm9a4ZL5cEy/VFTXlb018
         jY/2HdscaaveSluIJlDkLh6ZmpuFmn029ea9X5VH+jXTr28xpn+HTc8INCWobsJCrXCc
         rbGP8LOaEBT702sWQrxVRpyMCrfq2+87+QShVQgny0eI7zpIt2+6zNnj0Vptev4Em8mJ
         KEXtAI/ADMBiZ4aX/uLLGx2bQFjpw6a3zK+BzC4j5DXz+0rKY09yvuwE3dpnv4s51SOm
         3fTYKPIjuLSsHjBqAWgawu8wozTwYDfCdyt7/lCNWnSjGIhyE3rtm5RWGmbDRQSCuaSN
         i5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787490062; x=1788094862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O9vqDCNyl1ldG7SeHQIKR21U6TYJFN/g7wDlqKknSzk=;
        b=O+WUyAI2MMQ69Hc+tpXvJPWju5MmcEi1NZAUSpCk27k0mnJ3NuiKkjT4RSIs9OgImu
         kQnzIRjFlkfnTqLtUzJY/qKwO6udUSVYrp0OZxZktRgjIBiRFrk6lmdqLXnM+CEwq+FQ
         0bk8e1MasvhnkS1QqRivxot17Jx1tCJFFFCwJRRpzOtrvcejjALAfXAGlAi+iTz4zfoW
         Dst2yDEaumAkaZBvip7HEf9ewwe20sF/F+vaoc2RdmvUcdLow1nvD+Xw891TJgYIvLgz
         +LxkFwcD+vwnFbsdDGeajT5YybCZy+Fuix5bujzk+uRgmJp2ZI9nKVYrFrozct+1PkWk
         VA0w==
X-Gm-Message-State: AFuF++n+ytj17ymi3J9KylMo3r0F5gZkjNItgeUClDVyFNllemMBbk0X
	5bVg7HmnaAk1AETLJNgiuqwHoiap3QFIzg8UrrAD7Est3+7o+Ly81H5pwpTHrmB6v51kTbFcIM/
	vzOELNX/GjAIuh5mdpcA/CAGtVfHQqzE=
X-Gm-Gg: AR+sD12058hA+s/5IJ5d+l9sywf9gO/NF1cJ7Q1SkmhNsmwotXGF9pYTYChgXnfjXQJ
	96TRn40wBsP+6Y6x6/eVkWd60FyQ5AZpjL63oGj79pZBWSq6pCqLCDr20xIH9QLJEXVZku3dRCv
	s+rBX36hozdg+k4fKghIT5rhypW/8f0+oHA7VnVbm2ItXS2Q/h7arFeoFtdZvNP9y454oioWAzi
	nnxDpmvQncF0NDmpg9fQQeNShPhHHD6/O8UTEs/ZT6EzuTtBjwUsiKidIu1hVO+aSoevRhqGEHq
	FndsktTUCHzBoQq0NpK9vYuep5A7zFKz3jv8nXJpcF0kUw==
X-Received: by 2002:a05:690c:d83:b0:80c:cad:c4e5 with SMTP id
 00721157ae682-849f7ff26aemr72556687b3.30.1787490062386; Sun, 23 Aug 2026
 06:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260822054620.452262-1-ming.jvle@gmail.com> <20260822060014.AD2681F000E9@smtp.kernel.org>
 <20260823210208.25e21677ac0c691037d7ef24@kernel.org>
In-Reply-To: <20260823210208.25e21677ac0c691037d7ef24@kernel.org>
From: Keke Ming <ming.jvle@gmail.com>
Date: Sun, 23 Aug 2026 21:00:51 +0800
X-Gm-Features: AcwNN1XIQy6WlLi80y3ZyXLQhI2zYm0ez-nOfVD-Q_nScJLYDeV9eVrRCcMmrdc
Message-ID: <CABbwK514OkuOk4E97a_45BkSKU35nsMAV0U1YqmoYOXEhysqKw@mail.gmail.com>
Subject: Re: [PATCH] uprobes: Free utask on dup_return_instance() failure
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, agreed.

> Hmm, this seems another bug here.

I chose method 2 (clearing ri->extra_consumers when dup_return_instance())
in this patch set. Please let me know if you prefer the first approach instead.
