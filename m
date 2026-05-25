Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895303370E4
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709763; cv=none; b=iF0yjjKgyQuOKVG0f1vEnxziE4Zpw5/SQH77yNCf7ehoax8kSCjuDG/V7vuPdv99mViAKhF9t02LIrNIBABMNYZOvkgeZWiLk5CrktZh5yquO9FWnwgQrkv4ChHwlBxFDGtNGnwjkK/HJsM4XW/1shSU2cUvkp/SU6mBX2Se/pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709763; c=relaxed/simple;
	bh=KrxdAeLUhOdbTOeg6AjThXmoxH0Kuzb7+z3TySKZ5Ek=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cM5EuAcrWYqCWSyj7eTK8SubxfPRVzwvR4cf2tBy26SnGE3YGK+Hmc2u9SCWW7NV8obWdCBH5c91oIS9IXXS9QUY/vuajKBNTfoOGxbkDypmh9zdRojC1ckAKDfKYf8PZIbs8oW5xot+0SU50id5tOJpW9V3RLdtSsvRUgMLxdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ExhOknZ0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ExhOknZ0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so24627675e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 04:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779709760; x=1780314560; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kdsBBlxH/fBT0qTKbx/OGQlMNoMysgVbWBk3JCaqZ+U=;
        b=ExhOknZ0MWuPo0fl9g1gCsWE4GtwHuBpHhKFApwyEdR/+cub8+ct1QV+UpXe3TYe66
         Npe0NNN/XpUYn/Evj7gk5aDQTImgCy2Zm/Xu6n2YwrtmRUamWMd1biw/XnrN1wf47ZHt
         LrdGfmHL3XSgnv+X/yuoowvgrxQzXLGHDOKW2Or1yTXcpR1vmXBGcrYAvChbcgbU2DcQ
         BSZW9GR6XOEt1+CtWgue0yqaHMcIjiPydsh/6XSfgzxt1ThkUW7t/Q1CjbcfBWxbp4Vw
         /X+3DK5U+DPtpLZz8/HPiQ1YqxKgXg49rbunkA6x4Yv3ccT9AxPdpBn9gh0s66MYk/Ia
         sYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779709760; x=1780314560;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdsBBlxH/fBT0qTKbx/OGQlMNoMysgVbWBk3JCaqZ+U=;
        b=JxjVrbb2thbgJBzif+UyfNOif/UhYpAf2Z092dX6wV7kCrk1ggmOLJRKahaBpmovWa
         UWFPsB+NnvqIrJuJLoQEbYm52WdkVBN0jINKJpB1xuXKfiSFIgp1iUZpZEub98IjX999
         3GyPXcAItukRfsRevRXAlezwu8m/2llNO0mQPln66ly0v3FVFPR22mbJ+SOT94kR7GSM
         jkkgYBt2o4oE3ltrjjTfIb4yHsEl3oSyayCgso0HhMYhsYQIGrTKEk7Z5Be/KqJ5bJza
         EGs81qzPDGrvYWwVWpcZGXSI/rpVqAy7WEGxwsSgYrcfVZt+7y+7MvtgTZsSWTFAszcX
         1OLA==
X-Gm-Message-State: AOJu0YwcdNoYU57LiekfrPUotfudi6HKKFRi1RG9rHxli9BpjQ25xuDd
	t+W509Q9ncYWmtN7y83g5YvVrurpRZHTJX2JaCoGvhbmS93yYqnzSSHvGsagZ4bPijfUOa5W9zn
	AapZdCLU=
X-Gm-Gg: Acq92OESC8POELJQs4kX7mS6jGU1XhxoPak962BLWbxVZno/4Bg+U0i3uuwaNhlvPI2
	BywXVe2fsVJQdj8VjDNIsuM+X96ASWs7nZ2ka7eXzsTxqMAPp0JB7SkcGVbNZnkrU7GqG2DP+sP
	Ufak9LTThe2HpKW9x3z/eVXNDQwBPUNWWMQi8Nny2V1R2X+OuGxrqyGwd0DSLf8Cnhaipqqv2ky
	FzUYA9536e3dFX/zX1Jx9TQrau3v/uvLGN9bTN5S5J+ra+zKELm7dYNyl4Qq6WOsjIthYe3/gGW
	l7MRwVsqxQ2PG3RU7tv/iG3bMG+nyyYrsy/Ld3cnZ7wfSQ8jque/IIDd1P+m8GW9RmSZof7r7zL
	b3zcEhq5xWpR1cJ0p7D6SJ1dRB3eP4pA/xHe6lbku2y67JWobo3XHmGzxvtazcx6/KWB+LSF7sj
	i4+aXb2+0uf+5FlhXUXtdOCMT659wmbj7apgNGGgvpWMbqWt8OkVKENl08OqKFUZ63m5E=
X-Received: by 2002:a05:600c:1c21:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-49044ebc2edmr234633755e9.24.1779709759832;
        Mon, 25 May 2026 04:49:19 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:585c:db3a:fcb:e21f? ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49041781fc4sm120310185e9.1.2026.05.25.04.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:49:19 -0700 (PDT)
Message-ID: <d329f22e75fd01f2250490e4cba87f064a726f52.camel@suse.com>
Subject: Re: [PATCH 1/4] selftests: livepatch: Introduce _remove_mod function
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: sashiko-reviews@lists.linux.dev, Jiri Kosina <jikos@kernel.org>, Petr
 Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Shuah
 Khan <shuah@kernel.org>,  Miroslav Benes	 <mbenes@suse.cz>, Josh Poimboeuf
 <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	live-patching@vger.kernel.org
Date: Mon, 25 May 2026 08:49:10 -0300
In-Reply-To: <20260524235906.267EF1F000E9@smtp.kernel.org>
References: <20260524-livepatch-unload-on-fail-v1-1-7465de7f741d@suse.com>
	 <20260524235906.267EF1F000E9@smtp.kernel.org>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sun, 2026-05-24 at 23:59 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Medium] `_remove_mod` uses `die()` which will terminate the script
> during cleanup operations.
> --
>=20
> commit 7b1591f4e5c3b351136e7fe2821eb2e15ae59ad0
> Author: Marcos Paulo de Souza <mpdesouza@suse.com>
>=20
> selftests: livepatch: Introduce _remove_mod function
>=20
> This commit introduces the _remove_mod internal function to remove a
> loaded
> module, intended to be used during cleanup when a testcase fails. It
> also
> refactors unload_mod to use this new helper function.
>=20
> > diff --git a/tools/testing/selftests/livepatch/functions.sh
> > b/tools/testing/selftests/livepatch/functions.sh
> > index 2bc50271729c6..3ec0b7962fc5c 100644
> > --- a/tools/testing/selftests/livepatch/functions.sh
> > +++ b/tools/testing/selftests/livepatch/functions.sh
>=20
> [ ... ]
>=20
> > @@ -241,9 +241,10 @@ function load_failing_mod() {
> > =C2=A0	log "$ret"
> > =C2=A0}
> > =C2=A0
> > -# unload_mod(modname) - unload a kernel module
> > +# _remove_mod(modname) - Internal function to remove a loaded
> > module.
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Use u=
nload_mod() instead, which also
> > updates TEST_MODS tracking.
> > =C2=A0#	modname - module name to unload
> > -function unload_mod() {
> > +function _remove_mod() {
> > =C2=A0	local mod=3D"$1"
> > =C2=A0
> > =C2=A0	# Wait for module reference count to clear ...
> > @@ -261,6 +262,14 @@ function unload_mod() {
> > =C2=A0		die "failed to unload module $mod (/sys/module)"
>=20
> [Severity: Medium]
> The commit message notes this function will be used to remove loaded
> modules
> when a testcase fails. If used in a cleanup path (such as a bash EXIT
> trap),
> will calling die() here terminate the script prematurely?
>=20
> If a module fails to unload (for example, if its refcount doesn't
> drop),
> die() executes exit 1. Inside a trap, this aborts the rest of the
> cleanup process. This could skip unloading any remaining modules and
> prevent final cleanup operations like pop_config() from running,
> potentially
> leaving kernel tracing persistently enabled and polluting the system
> state
> for subsequent tests.

The system is already polluted when a testcase fails nowadays, since a
module is kept loaded either way, making the next tests to fail if they
also try to lead the same modules.

The current approach is trying to make it more reliable.

>=20
> > =C2=A0}
>=20
> [ ... ]
