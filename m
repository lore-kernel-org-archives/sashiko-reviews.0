Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A74949AA28
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 21:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903587; cv=pass; b=c3ADYaRWygsa71YDwZXgwiYqu0kkZHAQ0yJ9f2rJAidsMXgonudiMpyaE22s4VU2VFFlL5gWPGiFbx6AI0vjDW+V8soIFGiODLdEGN5J6jclwQuhlmpKlWWuwiPAnzyLi4izDvAFfWBJ+z4tNq2b48J93LMz/Qmf+vO2mkMCYEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903587; c=relaxed/simple;
	bh=bakvJblngIKuiCrhnaMIFW00XhXuXru4tKuCyr9fT7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sh8Fh2GS5rsIVvKpQqxq4FgFinjcO27t0/o9z5pSNFoRfHZGXlA22uJcCBcCvRsxHsT7fKEbkCySAaiIJpS7wAbh2Xu1aVN2jSeUVTd3GY0N0/RMsJD9sGt66yfTd/Kb0CsYNEwVaqRCnc5ACIBYePBfia7sRBMmi/YwXaQ5AUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bp1vyc4c; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp1vyc4c"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2566so953552a91.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 14:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903585; cv=none;
        d=google.com; s=arc-20260327;
        b=L/Y5sW7IMNI5Nco/gOeV2rPWyLvsdj0bS2WUQrDi8DQI6dD2RqtGgL8M8wKxAK1JPp
         qJoXJajFnWcc+Megz7KUN/7Ogaz0278YfxeW+KlAlPprFtyYSsPYdTCCwzxCMFPu/GJ9
         YPIVhazhKgtuzrrwi2BOK9kVJC9D6Ag9QDyTHy3ufIb+nAq27mecqvaVjo1/+CJId2BA
         wn/GW6izASG3U63IgKg/9rojXEy5QpAlbtLkIGE0jlfGCn//Yalq9QxMPLVnP8kiqxdg
         F3jkMEDjmnUZcD9Y1k7W//8gARlCCx1QTYwxgvxBWIhyFOB7OyrbHkZ4lv228LW/qMMI
         oGjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pfd3T0qT87+D34AEThHxdn2D1F0SWsx0LtE8mR8K1j8=;
        fh=Rr2qG6gO8cR9EWpoHYmR/F3m17v6q3f1UU7ndA+9ZmU=;
        b=hIU42cPEgGg0EmMLFIT96xrxiD/HTBiwikV3B2w+Z9fxf104cJHgwf9XpNYrnDHNnl
         GYkFdi0TNlcPryB5EBJwe/B7V83PBBihB4b3/U2zdpknPOkkb+7z4/eXb+Y/cMkDmLAW
         J9wOhjP9ftXFwrPojSrOnnXdMci1jOHvu89mytnDZzHDagw6/aIRFNUl/p3SxrURJo4u
         wkH0iuxaaHWMVhobIMAjOeUG3jXX5sLrMFGYREiNmqUqn4iglGrv1znSMi4lEC/anDZE
         FBxgGZb3chATqBun9yW/Eo6w5bNKZFI2iRYSr1sqD5sRtfI7UA/5NozYyPxkEAp/tfRW
         iDjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903585; x=1789508385; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pfd3T0qT87+D34AEThHxdn2D1F0SWsx0LtE8mR8K1j8=;
        b=Bp1vyc4cTXq66Cmrza5PoXCqgxPXT6teDivbAentauaMcf7ok15UDtpYqpzymVgSR6
         rUuwo5vbWNje4wPTu2AE2E0OsgEDO81raeCmlW4Xiyinc4+AEpTKizDNlfVzkcrn7bcH
         fkJqcRIQl0aiVq4dkY5afi7TIGWAOeIO8QKXzPIYUgAKYC6vRDbCtmKWJ/8vPI8EtOBR
         dXeTck+yb+ZwsY0ayQxxVct+tNavDniFvMBxtNuGafV8qQbtG16RYhjtgAGUQ99YOc10
         cPmzN8K+1d3cKqzH8GZkHpQvohxMnm53kb+9Dea7g0sJK/TLXAlSmeI3Ys1La77L6nDV
         Y+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903585; x=1789508385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfd3T0qT87+D34AEThHxdn2D1F0SWsx0LtE8mR8K1j8=;
        b=IVA4kgzCjGwALKYQnzyJJuSgPVLyIfchRa7pqeZRw4AIWiFnKMfyGoNmL0OnXI2Cbc
         0qbP6QWP621h1m5wz2SmRzRPJW506ABgA+HcdUggm/cNi+FcP6nDk4U7kXBjfrxtQXJi
         s8Hu+H0DKhTeKmnZbcAdA/L5gSilTXMa1H6sYp3Q2NvhcGeUnbf7hC3PjEgsGeIFhLaa
         rec06L1bDcpSmeZUH0JtSch++8iDAsOK+CuG5DvQoV2okSTzpMX1qXXMjmJLJBOkKOmJ
         u49hDf4LX22dy5WtwE7J1kktpEPBm4QiuUDCt+PVl6viuSeDYjy+93vT79/2MT8HRKGj
         WWMQ==
X-Gm-Message-State: AFuF++nwmdV06B8M2EsVNfkczgrR92vF7SokbMhAd8oBHAxjRTQLhDCH
	1awba/HCufGlP6vrDcNub0X5cMhbhYTIQBaxGMLIzyWGC2iLLpI5iqJbw3OwBFRhKUeliQOH3f/
	o8mRWXKziZs/r4NgGbO3hkZlK55IElm6L2g==
X-Gm-Gg: AYBFou2hUm2C60TB6Xvqw3QsVNURNJm0ftvkbfDbUZObNYdQtYCdOaZ5oZ7NXTTdXf8
	nicJJbgwHUBPoxgUu68BxNlbB7pwoPyyEH6HcjkR1ZOQ5bfGH0d6m5h0CFPxGrEUXPOo8iC0n7z
	i1Y0InrOpMz6d0GMqqv5hcCqC2pwDB2/Ogyi8Y1lKdcwwjW4zdT+Ca5rywNm5Us6keX28LYInA6
	DSDoYpYxn1+BVIa7e4fCRC+CtLhPHO2+txeoEh0+m9pNL2XeeM6p4EkUExmQnkry/jZPeLkqfG5
	x7LvFm9MxCMdGwhc3D+Tow6TYsFEKa/zaReGNKvyGzupdn02d3n/tSEqREwTxLwYnbsmD3IoMeB
	Lgy/ShBnVHfUs9JBOu+lBZgwvLXFRzqY=
X-Received: by 2002:a17:90b:4c03:b0:398:bac7:72d0 with SMTP id
 98e67ed59e1d1-39b3d86acf2mr22472586a91.5.1788903585475; Tue, 08 Sep 2026
 14:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-amdgpu_debugfs-v1-1-3b659e744691@igalia.com> <20260908201504.5C9411F00A3D@smtp.kernel.org>
In-Reply-To: <20260908201504.5C9411F00A3D@smtp.kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Sep 2026 17:39:33 -0400
X-Gm-Features: AcwNN1XiQcxZYZn6Y_zxh-cC1A3b-Ks9xObBstzBva-di-BAV7A8YC7qh__1sb8
Message-ID: <CADnq5_NkuyG_dmVeTzSe41F_8CHjiy4Nh0WH6DjDYx78jpjYLg@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/amdgpu: debugfs: avoid extra EOLs in amdgpu_gem_info"
To: sashiko-reviews@lists.linux.dev
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Tue, Sep 8, 2026 at 4:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] NULL pointer dereference when printing imported BOs in debugfs.
> --
>
> commit be759dc89504ad9041bef159ec02b120e04cf61b
> Author: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>
> Revert "drm/amdgpu: debugfs: avoid extra EOLs in amdgpu_gem_info"
>
> This commit reverts an earlier change that removed newlines when no fence=
s
> were attached to a dma_resv struct. The original change caused multiple B=
Os
> to be printed on the same line, reducing debugfs readability.
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_object.c
> > index 5d9d137209b6f..1b6c32a177fb6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > @@ -1701,9 +1701,8 @@ u64 amdgpu_bo_print_info(int id, struct amdgpu_bo=
 *bo, struct seq_file *m)
>
> [Severity: High]
> This is a pre-existing issue, but can the access to dma_buf->file cause a
> NULL pointer dereference?
>
> In amdgpu_bo_print_info(), earlier in this function:
>
>         dma_buf =3D READ_ONCE(bo->tbo.base.dma_buf);
>         attachment =3D READ_ONCE(bo->tbo.base.import_attach);
>
>         if (attachment)
>                 seq_printf(m, " imported from ino:%llu", file_inode(dma_b=
uf->file)->i_ino);
>
> If attachment is non-NULL, dma_buf is dereferenced via
> file_inode(dma_buf->file)->i_ino.  However, bo->tbo.base.dma_buf can be N=
ULL
> for imported BOs in several scenarios:
>
> - BOs imported via amdgpu_gem_prime_import() allocate a fresh GEM object
>   via amdgpu_dma_buf_create_obj(), which does not populate obj->dma_buf
>   and relies entirely on obj->import_attach.
>
> - When userspace closes the GEM handle of a BO,
>   drm_gem_object_handle_put_unlocked() calls
>   drm_gem_object_exported_dma_buf_free(), explicitly setting
>   obj->dma_buf =3D NULL, even though the BO itself may still be kept aliv=
e
>   if it is mapped.
>
> When debugfs iterates over these BOs, reading dma_buf->file dereferences =
a
> NULL pointer.  Since this can be triggered by reading debugfs files like
> amdgpu_vm_info, could this deterministically oops the system?
>
> >       if (dma_resv_trylock(bo->tbo.base.resv)) {
> >               dma_resv_describe(bo->tbo.base.resv, m);
> >               dma_resv_unlock(bo->tbo.base.resv);
> > -     } else {
> > -             seq_puts(m, "\n");
> >       }
> > +     seq_puts(m, "\n");
> >
> >       return size;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-amdgpu_d=
ebugfs-v1-1-3b659e744691@igalia.com?part=3D1
