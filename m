Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95A044CF44
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515270; cv=pass; b=ef3qE7DfHVEy5RoFZHqgQ8Qtz22ytfw7RDVnztdgIp9QTdVVIy4hn0hJ2RuyHQCGwYEMyDiU03Rw0iJd3r+xLGzOeSz9RYwy1Nh4yt+Q3glkbkFFZ8/aBZJ7frD0cuqzroOppww2tqV+PIliaQvdfyUbCde6TKD0akevnHH5K7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515270; c=relaxed/simple;
	bh=r3ECCAtGbH7zr75T8t2rfCw+syUIUNTuubOlyZPJ6YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4fSCT6SVfSg1unRyhAL08xPC7F9d0MNW3jqCaDx7yA5fVBG5XPwwG+wzDMTJnlX5AIV0ozGjEGt1bP7MCMCEqzbBgBcDejL68v2Eqq6S/NsB0hFsBRhUGQQcQ6hJTnJ1YMZJFfILJq6Rwf8KyU2fRTg2y2qARhMYHrNCRu8sSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h4BiOLwI; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h4BiOLwI"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9f6b94a49so392485a34.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 05:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783515268; cv=none;
        d=google.com; s=arc-20260327;
        b=APqTgDy7Wckpe8aoiIXAxD3jstzD/V5+NpEVYIxlN1YzjaJroVlydyweJCPuOe9bkw
         J0uQtmQnEfENpHGF34h/+Ek7do2NOeD5Wmi8d2IAt9O1e+AMufJJhhFP7JOsxCg4i+OL
         Vsnc2TDlPU0mCE4ZktdHSZKrlpAyYFjTFn2RWX6Sn7DkQRLJzpIS7Fbdzz6Y1X4QTvf2
         xcv05uywC+QtOhxIlq1XAHPf1e9xsmOHRC+lrMa/W9FnseJBqgEgAo4cfW9vWNYt36qV
         G5/01Wrwie4q52DfBp0ECr1r4ESG6WuAK4WqENgnmeMk8lLAUIqFcyZXY7sFhykYKTJD
         fR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r3ECCAtGbH7zr75T8t2rfCw+syUIUNTuubOlyZPJ6YE=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=EFOh3RgjyCRdqVqWe8aKWkhA+bNYX+zq15sx0fMhuqcdc2JsTrQmlkIjBJMDW3x//F
         4fQqY0MGP6uqhLYxOSm2Oxin9CiT8CFCpFIz0AYRomnlpoIJ316/R2hWr3n0DVXu5aSg
         cQe7JThSDxmzh4q8HNFlzhpZncA+LSZfkhYA6wGDH+JRvcK0Vogi989ZknXcNrQfxDBC
         SOk0ZFPSbx/FqphddiH+96erqY6mOeY1uHuAtHbMOr4bvliAe4FK/GU8aV0tWkCS8lUf
         d9nsEva45Z4Ohe8W7rMmxQu5FDzSkVDGjxBsAILtLQ0wTaYa8f67YGe7LkpYKplv2yqX
         E//Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783515268; x=1784120068; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3ECCAtGbH7zr75T8t2rfCw+syUIUNTuubOlyZPJ6YE=;
        b=h4BiOLwIPCYhVk1bD+V0lAUwenCk+878N+uOqE2ToaHHN/Tdr5XE6NYHKCqMynFJQo
         vGn4cvbi7DhbDuwpuEumHLOkNejxksgp4q2QWaZBry+qD6TWEqCKzAnDqm8LaadxNPPV
         hpa7T8Y8x/a5QHXhHaOW0G6kKWJtHe5ytXGf+H7v4DvEgbUlDT4T8jCNqb05d4xJ8jdn
         GCpIvUl6GPdGj/23BwJrCa/Phbyej1JhDsOoVuUA0+CaEcDMg5Jaw8BzMfh/BR8tVeAi
         HDgIDrymI/cF8k33caVufE4jrRURM3yK2v8NmOHx+voFZLIRxwWDr3LAP6ygyUXsB/2w
         8QGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515268; x=1784120068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3ECCAtGbH7zr75T8t2rfCw+syUIUNTuubOlyZPJ6YE=;
        b=RXMhJTx4RP3dSxjPsFzW5kIR30MZ6RMhov9ViPodDyB3Pjw0UG2nJiIfyMgEm8AFqK
         FAoz2zNBo4j3w4xfNhUqA6/JjCzU1yUUiYFF5whfGH9NTthZHL4HlNlVPJJJM496rhac
         APc+Bit/W9ofkDFcCAfpW6yhoWBICUWAjhYcJqVwHnVypwijoLRfg4fUxLEi856VHNRq
         X4rpFKwF+Ss7K1DzDiVm0NltbAIZmmCb4PqtzKA8OZUk5kSgpNDHbsaXVUV5vWpTpIYF
         dbBWU/hNZxVaTpWrc5K5+xdC353cYfAGEq3ETjcFbiTy+CwVZa8Smnb1G3gM0KSfiEyC
         au4g==
X-Gm-Message-State: AOJu0YzvNHUz+Rm6nawx75ZiEfqAHoD+iM1Rcwgcl4vNVjDGLsM3TsYX
	69niY/tXxj5QGi1ffS/vlEY0CMLExeS8hDIM24Lbch0S2iEgXrjqlE5BGIB/2Cfp82XPRg7+/wS
	OQXtIwgs9pP133rKkui4FWnmJCBlpX1QiX24VzBR7vfsi9fkBZ2jcavgXkw==
X-Gm-Gg: AfdE7cm2KMzgCKSBsYykh4x31NPXMrYxEXUnqW3UH2GAtaH3dRhbJaxpdt6qnmbvJyA
	mlbdQpHXl4A14NGMl5STyzVYhuQSn4MsOjXGjZ4eLydqjksw56Szl6e+Htp/N7hOkpIA83Z2tfK
	5iF8APKrbt3VVdcwjjtWUqsoE3mCD7pqdcrrtLLDt3orFDSgw5acPCUNxiW7cLsO9NhBUX+dxs0
	NJJJ92eIW1XUxqmCJpwoQ8Xh+GD4crqxJDOiku+BqjFPXaCZJD3i+Eve+/+ZCrwQShp9mHCPIUa
	LW36A9U=
X-Received: by 2002:a05:6830:2b25:b0:7e9:ef39:1caf with SMTP id
 46e09a7af769-7ebcff98b5cmr1742576a34.16.1783515267714; Wed, 08 Jul 2026
 05:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
 <20260708-ccaione-genio-serial-aliases-v1-2-bf22229e9383@baylibre.com> <20260708112603.9532D1F000E9@smtp.kernel.org>
In-Reply-To: <20260708112603.9532D1F000E9@smtp.kernel.org>
From: Carlo Caione <ccaione@baylibre.com>
Date: Wed, 8 Jul 2026 14:54:16 +0200
X-Gm-Features: AUfX_my1kvVsqi1aym_CBX5VWlURwFfbliwIVwoILuh3pJrI17C70h5-11qux0c
Message-ID: <CADh8Lsfc8PYaQPewRk9KM_QK_3ju3OZtuHjovcjnNeYOsVr7iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: 8250_mtk: honor DT serial aliases
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 1:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Runtime PM APIs are invoked from the UART PM callback before run=
time PM is enabled, causing circular dependencies during probe.
> --

This is out-of-scope. Not going to address this issue in this patchset.

--
Carlo Caione
