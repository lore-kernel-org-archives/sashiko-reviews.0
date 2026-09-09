Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19EE3815CF
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 07:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939083; cv=pass; b=XV7JHTfvif/EFymOAvpcbY/68ma63q8AVhizkDTBl37fIeJ0V6ynZ6dWiIKvrjslVtfXFindRv1argZ1whkgrXBthdf+NPQpq+TIu50owA5uJ9JxSHj3M6IjCM39O75bA3jhdXhKjL9/BBbyA/RLdyRc73t+aYqtBN2PdHX8UKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939083; c=relaxed/simple;
	bh=p5yzCPStQZlFYqWgsz/tWvBj/3blYllpwvjlsk3DA2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQMRGZ2TcuiTMxv3aGrzuS4jx8PL6Vyydd/nt8+/meFOo1e6doLtgstD2bOfffhUt5IhyTx4y6USGztbTzc1+qqkK1wUdki2Dc9P8RvWeMsMRU3Vtw9T2eyGKPoUKmCx0wFuoynL1PXiioFKuO+7UkpYeVPsaZCKO99odZEwiNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKFtrCPJ; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKFtrCPJ"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdcdso8169667b3.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 00:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788939081; cv=none;
        d=google.com; s=arc-20260327;
        b=elCkfUBF+q9qR1BD3rZl74/84VLMKssaLQ3fSuBFE2Ay55lszDRD9zDN604sHU5cvh
         CkTCK9B0+KXTORsZxDl4xB0vpGSNiyJ2UDlmAWKbo2yuyJdjbFFQf+lJIVFVR0kzr17N
         tl8wGjTdMwnAhkEC42PGDJ7qVPNZdFKCyS7kqKNHsWrq2E0zdyarkRgr5Hkr/G17Aipt
         Zg4A4SLy1+Hx6elZ1mQMb8WTV6W3s6Zm7OKDciG8mVIbAeoCTaYrBU0m1uXcZGYY5SVD
         8f57PuyC7Q0dfkfoBMILaDubBvZoVLEowOzrdIJJR1Mc3Ln5sJ1q9Jz0lcfguIpAvdPB
         eENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zR3F/9DDyLDml5HLZtlb3GBYAZ72/4f2Si1r92K3OLs=;
        fh=xGejneNy1QbgTTbc3ezIFHQqTMgZlhHdQQqWg0xwTUw=;
        b=UWMEvvMVmSDNcdFd+FSNY7Qpm4JLgm3Fu1/dBpGBiaCwBp8ExucdoOf6TpIE5wV5rb
         xJv57P/gAN5n4w1RXjFEFpj5NgVSSdYJmLkNZ1mL6z6Yqu87lFlVTzjEmTX7kzF2DbOc
         l01m5z1DdZBd+23y7KVD2gWkcXhHVbrd5DG51vzmu4BdwsCMLm0NpUt0vNmJ56EaVI+/
         mp2gqt1ewg/z5/PHk5aXaurHKc2AFBmF8y1ccg/ZZxX/676oP1Iim27h/pT+S08jRWHr
         78quPNlQpcgBo+8q/0tkNfpbqa6HnxPdnsH9UQrN9MgyqE/abq+77rcLPubRziAyYOkI
         6IEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788939081; x=1789543881; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zR3F/9DDyLDml5HLZtlb3GBYAZ72/4f2Si1r92K3OLs=;
        b=XKFtrCPJd3mYjEHNvPAe+cJBdTFPpTOuSG4fnrD/aZYoyEpT1VxSm2eh54qGVbYoa1
         NXOcR/dHKmxEVd7L9x80eXBHqRLVHUbeZ0B1Gq9o8E3YVNlrK5lOSL0DP9K31QcXy1Sl
         Pq6jtP6C+qVwFB6B4cpH/m9sK5wiqyRbDZqvR64PJKq3Ybdlw+LYz0+W9qnKEn2A6NRz
         mKN3PRwIX6S1tM+chCHxgW6RIHKpbvhuAwnywDxomgCpAPVlksh4M+hW1Xf0sUtj74wR
         mxh2G6oO2RDDKG4djm4MR6RVVugyiu9yHsPjC8+yYbx9LPuL25zHyKob59yFJ1T0brdY
         rY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939081; x=1789543881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zR3F/9DDyLDml5HLZtlb3GBYAZ72/4f2Si1r92K3OLs=;
        b=ODWGCZcW5FgOVPiuP8c6h8foC+0IG037hhFHn9WDQaz0zDFIjt9cu6uBg5TE2oIHkv
         zKH1i2DwtvwxD5a+ouPPsMj23Z6l8oeI7cqsgsDDUALb7/k7y3JT/7i6M/uEAfgIBWxy
         y9vrPRrx/v0Hd9Ab3YNVy5FfiCzxt12KZ221+F4JhDEjxu0BPvwipFHybBMfiiy8PBOO
         ARDnT2voRMhlTn+XRh6bxU++HZ2LOPjGmBoEjm0YCPWJVKyp/7K8jS5pNb8+aCb2OdMl
         skUnYNw7Az91NTyaDvFijD0vNy89ZjuObnYygeUNnolh6hAVwwxnADZ7PrOeEpRPJ48a
         tpvg==
X-Gm-Message-State: AFuF++m4ntomzsu/cbz3hKe+Jxz6F/02EK7ImOMYA+OajKH/+/TTmrj3
	JVzDdHm1Z1qguWoxdbAPgY6UW/svqmyaHix/BUUOXX8bnQrIWRci3XJoMKO26Q7kiRuaoUhyQjW
	k9bLhMdUhN2D8TL1cwjwnm11roQssSisM5rHO03I=
X-Gm-Gg: AYBFou3dHBeqd9J+bj51zRc6VZd47ZkZSGTNX64YSHfA1hQTAwHd+7/gHdB8n+zOrxz
	iEMvk8oUbCviFrtfqMnRgfIrKBGKVmilZP642AdNKfi5XguzTm5FEQuXz1uFtNdkgR21SliVwAj
	up16q8Cpe1q4OLdgn7gNZEUOb5pmxg3qS3JgTBA+/mwVlTY1v+/vulxfGsS9+//4bLNDSclMkrV
	ebI3xOwTFV4WOCUldDYCQza4DTKKtfxDXb6kVP5t+7GuFzDWoVFyv5Z0ItD3CdceEPg2UykR9DK
	ALxIpTPbMKhRpSRirAfAXHQyOOegGsEltRUjsfD5jH9IhvJANGvPwGDmvt10ua+8pBVW3m9B3zo
	MNzQaEwoRmp+jtlQBipnWgII=
X-Received: by 2002:a05:690c:e691:10b0:81e:6bd6:39a5 with SMTP id
 00721157ae682-87f22b7f1f5mr17134887b3.1.1788939080568; Wed, 09 Sep 2026
 00:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909024324.16002-1-laoar.shao@gmail.com> <20260909024324.16002-9-laoar.shao@gmail.com>
 <20260909025756.19AEF1F00A3A@smtp.kernel.org>
In-Reply-To: <20260909025756.19AEF1F00A3A@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 9 Sep 2026 15:30:43 +0800
X-Gm-Features: AcwNN1WlnXUbKH1a-V5kY1yknsJbl7P2Fl8izGKWXaQQ2vwTHlxZ-sqwJ_vAplE
Message-ID: <CALOAHbAft8tOO4H-Zo2tnDH1xP+u-QnKeTN3ofSngr2cK_7b=w@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] selftests/livepatch: Add state test for provides/obsoletes
To: sashiko-reviews@lists.linux.dev
Cc: jpoimboe@kernel.org, song@kernel.org, pmladek@suse.com, mbenes@suse.cz, 
	jikos@kernel.org, joe.lawrence@redhat.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Medium] Unloading independent livepatches in FIFO order permanently al=
ters the global `console_loglevel`.
> - [Medium] Mutable module parameter 'state' causes a memory leak and fail=
ure to restore kernel state if modified via sysfs after load.
> - [Low] Missing sysfs value verification in test 'misc states, misc provi=
des'.
> --
>
> commit 253fd167cb01a1b8aeead3420135a4b275836ef3
> Author: Yafang Shao <laoar.shao@gmail.com>
> Subject: selftests/livepatch: Add state test for provides/obsoletes
>
> This commit adds `provides` and `obsoletes` module parameters to
> `test_klp_state` and `test_klp_state2` selftests. It introduces testing
> coverage to ensure that reusing a state ID across different provides IDs
> is rejected, while it is allowed when the new livepatch obsoletes the old
> one.
>
> > diff --git a/tools/testing/selftests/livepatch/test-provides-obsoletes.=
sh b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
> > index c2fbac3d0e06f..8b7b5eded80c7 100755
> > --- a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
> > +++ b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
> [ ... ]
> > @@ -213,4 +215,238 @@ livepatch: '$MOD_CMDLINE': unpatching complete
> [ ... ]
> > +# - load two livepatches with different provides ids (provides=3D1 and
> > +#   provides=3D2) that modify different system states (state=3D1 and
> > +#   state=3D2). Neither of them replaces the other, because their
> > +#   provides ids differ (and the obsoletes lists are empty), so they
> > +#   can coexist.
> > +# - verify the provides sysfs value of both livepatches
> > +# - disable and unload both livepatches
> > +
> > +start_test "misc states, misc provides"
> > +
> > +load_lp $MOD_STATE state=3D1 provides=3D1
> > +load_lp $MOD_STATE2 state=3D2 provides=3D2
> > +
>
> [Severity: Low]
> The test documentation states it will "verify the provides sysfs value of=
 both
> livepatches". Is this verification missing here before we disable and unl=
oad
> them?

will update it

--- a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
+++ b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
@@ -404,6 +404,9 @@ start_test "misc states, misc provides"
 load_lp $MOD_STATE state=3D1 provides=3D1
 load_lp $MOD_STATE2 state=3D2 provides=3D2

+check_sysfs_value "$MOD_STATE" "provides" "1"
+check_sysfs_value "$MOD_STATE2" "provides" "2"
+
 disable_lp $MOD_STATE
 unload_lp $MOD_STATE
 disable_lp $MOD_STATE2

>
> > +disable_lp $MOD_STATE
> > +unload_lp $MOD_STATE
> > +disable_lp $MOD_STATE2
> > +unload_lp $MOD_STATE2
>
> [Severity: Medium]
> Does unloading these livepatches in FIFO order permanently alter the glob=
al
> console_loglevel?
>
> If MOD_STATE saves the original loglevel and sets it to 15, and then
> MOD_STATE2 saves 15 and sets it to 15, wouldn't unloading MOD_STATE first
> restore the original loglevel, only for unloading MOD_STATE2 to subsequen=
tly
> overwrite it with 15? Should the teardown be LIFO to properly unwind the
> loglevel changes?

Ah, it should be LIFO
I will update it.

>
> > +
> > +check_result "% insmod test_modules/$MOD_STATE.ko state=3D1 provides=
=3D1
> [ ... ]
> > diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_st=
ate.c b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
> > index 5c5872ff25665..1de63c2438d68 100644
> > --- a/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
> > +++ b/tools/testing/selftests/livepatch/test_modules/test_klp_state.c
> > @@ -9,10 +9,25 @@
> >  #include <linux/printk.h>
> >  #include <linux/livepatch.h>
> >
> > -#define CONSOLE_LOGLEVEL_STATE 1
> >  /* Version 1 does not support migration. */
> >  #define CONSOLE_LOGLEVEL_STATE_VERSION 1
> >
> > +static unsigned int state =3D 1;
> > +module_param(state, uint, 0644);
>
> [Severity: Medium]
> Could this mutable module parameter cause a memory leak and failure to re=
store
> the kernel state if modified via sysfs after load?
>
> Since the permissions are set to 0644, if root modifies the state paramet=
er
> while the livepatch is loaded, subsequent callbacks like free_loglevel_st=
ate()
> using klp_get_state(&patch, state) will return NULL. Does this silently s=
kip
> cleanup (kfree) and state restoration during patch unload?
>
> This same issue also applies to test_klp_state2.c.

will change it to 0444 to fix it.

--=20
Regards
Yafang
