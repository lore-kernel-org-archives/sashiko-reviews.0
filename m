Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B446374E4C
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786268219; cv=pass; b=grko5Jnfq+00mm/8RApIrsJ0tMqr6EfhYezpkNN79uVKio389ulJEal6GW7RM9gYah75oc4Az6fJVlJwJDu+2wUZokxtU7RX9zgTKJvmdvGBVzNHrOudaVje3/OnlqnyYPU4tODm7EXz2xZpJSZvyUFNor+KCo0Zegk1ng0fssY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786268219; c=relaxed/simple;
	bh=ndT2fmu22V7/A5Rw92m9ugx35X0wxzO6htHWnyL2S4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6gh6qomHT4fszMN/gpVYLo1M6fVmaK1UhvymIY93VtW/2BuNxnckbdf0bUubAzmDEsrFDNWXukCshIhvJCUnmrUPRIbP+AINj0LOqwJmcpv3EkwhqiVyChQQmbkECaSYlF+aAwQrAf+2gPYhJnDWmEO/I2G46SUXCs0UKZTL84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B++p39hx; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B++p39hx"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e6f2ee60bso48645007b3.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 02:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786268217; cv=none;
        d=google.com; s=arc-20260327;
        b=Ta3o7os1rzO6NJKQsU+nQcei+hUI9D7aUDct6lxtoB/IDzmeMolvDlQ8XDTAy39Hwa
         YbEz+T1anXtmClgdepL/AMU+BRM9N9MYS9h1y3QtYLNnusKdJnZsc2My2ydJ5uwTfhZE
         2Hpm3B3hL1sBO/AvwM6FoIT7ad0IeIJErVphL0B+1hjK/HKYh/Bn9XTPAUAY2vpx26+e
         yYg2rLD0fZOuVS2MnBKP9zy0piY6my+tF4qzAJducz4xkGsJnGCb2jlm44FzYgYWHMNA
         sbz9nQGyl2ifr/mniQJpjDSSZBrh96YiTZSVIPGOQs3MbUKQ3MwnVVNHQvIs+a5ZcvRz
         AHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nilV0Pn73Zsexcu5tZDlRh2Fi/j891cZt5rBBZe+zkM=;
        fh=ZeWqMmYkFkvgqGovo7a3LP2fpPw7KHcPDaZJDt+l0cU=;
        b=PlzjfpRwws6rY2S0yakx9VNcn+UKpOlOWJcCFqaQ90lpk7YPwJr6Zmv8QW3T3yODV7
         UnhaBzgvrJ7iUFDRXVTUlFBK0N5DVQBa++E60l2Yw+BynPq7mPuGW3X9PYqG05VIe6i3
         s0NJaf5ad3G4FMC+fsRBDLuJ0ObRaAXQTNEv2mVXxePOCVhFjhIWVudnmlEZ4EoIw4DW
         3QSv4OZy1dD01XvC8kc/6qB/DBWjhBRSOPmsmmjyup4t06t+Pk4tNdHXfqdfv862YFqL
         uR9ywYzpU5625kUWJ/HJegb+CyNY4/uRf/RczTWDUGLxlEiOlkwz65SasTja38kiBhMF
         eW1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786268217; x=1786873017; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nilV0Pn73Zsexcu5tZDlRh2Fi/j891cZt5rBBZe+zkM=;
        b=B++p39hxCpH6stbgY3I36Yun4xTIcnFHVm3ojBa31dVAwYrxN8VfdSD9qHwd9sQSWL
         4v8fyetcU4lFb5HLjxc02bQ8QKRqeRGgqTPwlhLlUw4OPG1OqPnuBJ60AutexAWWtJIX
         3yWIFP4Ik8AdcPrTg/m0aK4o8rBdqFcu4MXvsNESdNn9hvEmJj3aV5y/zx0PPMh4/k1N
         ApRz9M37zZ4DitbMg4gpjYlAdF5gV645+5KV+HY036LN+T5TPqLjE6iAA35MMSMh2Wtn
         WtUId5FD1hDHyc0hXFaLo5zKON3mCc2CKFczifwaoVxQl2mmT8YK9BD5z+JMqrbKmO1w
         FNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786268217; x=1786873017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nilV0Pn73Zsexcu5tZDlRh2Fi/j891cZt5rBBZe+zkM=;
        b=NDosGA0Fq/HBs9OrL20qIcYq/2Go2lbQWMXldVV3Uf7Wx0/oV69d9sigiWosqIQOj7
         nOM5otNaFusPpbRP0I3tx13ScpUzggc5fbvBBchiIDXskik5AmUCnTh343T5+XLqiWoj
         N0DcHVUktFU+3Na5HjyOwVfy2WtSO11EMVKoDOKmPlQDOepJBdvgxrmADNGcQEei8RJr
         A8DBO0z1knAccnH6SIk0LMJN2ccN3DeQkocZIZBrne4+HqnUSaXZLsSt+VYdI9V1mU9r
         gi3PqKxD/1QDkR/ZH68XZuuMeFtv6gldkpZ2XPEm9XSfNNShDakyQzUQTewMJ4fpwxlp
         5Asw==
X-Gm-Message-State: AOJu0Yx76LLezYd0m6TlPyFZsBo6ZOLSCYPSd7AJywKiR6DOUJ05AZc3
	QVZPxZ6uMB9R9scVkGD087R9mdhvaEtsl5K+IDHAM/l8SS7oaBSo6MwpJCkHg8IG2hSWmG8sFyG
	XEZf4iIxlTkcahavJhBAyy4pGtbXxwzjehvNDz69Utw==
X-Gm-Gg: AR+sD1250BAzzPuJ7gn/4TJ3FE5TRJvpOKVBUlaCi33t/iIe2GAk3517Zom9Aej+C9s
	oBq5DIKUVcaGib73YR57fMNUKreBAJxoXrn4NJiU+IRqAksZTaUTo8r+w29R1IqqF/RspXlFT7B
	VRjKvv9C1DMPk9BWroXt9SPEFkmVAIEHr3coQQGmRi41jlaUUFrCYroH/wHhpbJymhg1CunYwA7
	/khtsrdlzAYkckDaVUEUDPCZoXx5mD91BcSbrHBCwN0yWO1FsfEIoGqlJ3JPFrFDL3saZOOwYHM
	+YaHsbqFY9fSDNd27BGcLG1gxc+rISkxEzDzJ+AYr7/6njIUblSD0Pfyjl89i2Sj3mxCkfVF04j
	JQA==
X-Received: by 2002:a05:690c:c149:b0:81e:a373:47ad with SMTP id
 00721157ae682-825eab48d46mr58166357b3.2.1786268217502; Sun, 09 Aug 2026
 02:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260809091954.22930-1-laoar.shao@gmail.com> <20260809091954.22930-2-laoar.shao@gmail.com>
 <20260809092850.28E6B1F000E9@smtp.kernel.org>
In-Reply-To: <20260809092850.28E6B1F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 9 Aug 2026 17:36:21 +0800
X-Gm-Features: AUfX_mzIf3R94gtGbxg0spoCg4Bd58KzxwELBsN6ZKEoNRF178Rwy36LlmKMp5g
Message-ID: <CALOAHbD48m1VTLirFrKXgsDs+SAaaU3_PG21NQWbkt5SfH3E+Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] livepatch: Fix wrong index in funcs cleanup error path
To: sashiko-reviews@lists.linux.dev
Cc: mbenes@suse.cz, jikos@kernel.org, song@kernel.org, joe.lawrence@redhat.com, 
	pmladek@suse.com, jpoimboe@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 5:28=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The patch introduces a double free vulnerability on the `funcs` =
allocation error path.
> --
>
> --- Patch [1]: [PATCH v5 1/9] livepatch: Fix wrong index in funcs cleanup=
 error path ---
> commit c03811c85b7c79e0d681d9978c346e4424c48a99
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> livepatch: Fix wrong index in funcs cleanup error path
>
> This commit modifies the cleanup loop in livepatch_mod_init() to use the
> index j instead of i when kzalloc() fails for a function array. This
> attempts to prevent leaking previously allocated function arrays.
>
> > diff --git a/scripts/livepatch/init.c b/scripts/livepatch/init.c
> > index f14d8c8fb35fa..16aff8f736eb6 100644
> > --- a/scripts/livepatch/init.c
> > +++ b/scripts/livepatch/init.c
> > @@ -51,7 +51,7 @@ static int __init livepatch_mod_init(void)
> >               if (!funcs) {
> >                       ret =3D -ENOMEM;
> >                       for (int j =3D 0; j < i; j++)
> > -                             kfree(objs[i].funcs);
> > +                             kfree(objs[j].funcs);
>
> [Severity: High]
> Does this introduce a double free in livepatch_mod_init()?
>
> When the inner loop here frees objs[j].funcs, it leaves the dangling poin=
ter
> in the objs array. The code then jumps to err_free_objs, which iterates o=
ver
> all objects and frees the arrays again:
>
> err_free_objs:
>         for (int i =3D 0; i < nr_objs; i++)
>                 kfree(objs[i].funcs);
>
> Since the pointers weren't set to NULL in the inner loop, won't the
> err_free_objs cleanup loop free the identical memory allocations a
> second time?

This is an invalid review issue. Since kfree(objs[i].funcs) is not
added to err_free_objs in the current state, and it is moved from its
current place to err_free_objs in patch #4.

--=20
Regards
Yafang
